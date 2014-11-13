function[a,da,b,db] = linearfit(x,dx,y,dy)
% [a,da,b,db] = linearfit(x,dx,y,dy) calculates the linear fit to x,y input. taking into acount the
% errors  dx and dy for each point in the data.
% output: y = a*x+b with errors for estimated a and b.
% when zero errors are entered the resulting a and b are the same as in
% polyfit function. 
% the relative error in y must be greater than the relative error in x. if
% this is not satisfied swap the x and y axes (the function does not check this asumption).


if((length(dx)~=length(dy)) || (length(x)~=length(dx)) ||  (length(y)~=length(dy)))
    error('MATLAB:polyfit:XYSizeMismatch',...
          'dx and dy vectors must be the same size as X and Y.')
end

N = length(x);
P = polyfit(x,y,1);
astar = P(1);
bstar = P(2);

sig2 = dy.^2 + (astar*dx).^2;

if sum(sig2) == 0
    sig2 = ones(1,N);
elseif sum(isinf(1./sig2))>0
   error('one of your variables has no error, can this be?') 
end
Sx = sum(x./sig2);
Sxx = sum((x.^2)./sig2);
Sy = sum(y./sig2);
Syy = sum((y.^2)./sig2);
Sxy = sum(x.*y./sig2);
Nmod = sum(1./sig2);

a = (Sx*Sy - Nmod*Sxy)/(Sx*Sx - Nmod*Sxx);
b = (Sxy*Sx - Sxx*Sy)/(Sx*Sx - Nmod*Sxx);

d = y-a*x-b;

% find error
stdY = sqrt((1/(N-2))*sum(d.^2));
meanDY = mean(dy);

delY = max([stdY,meanDY]);

da = delY*sqrt(1/(N*(mean(x.^2)-mean(x)^2)));
db = sqrt(mean(x.^2))*da;

end
% written by Sveta Golod and Noga Hirshfeld for lab A use. 