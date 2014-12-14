function [a] = err(p,x,y)
    s=0;
    for i=[1:length(x)]
        s=s+(polyval(p,x(i))-y(i))^2;
    end
    a=sqrt(s)/length(x);
end