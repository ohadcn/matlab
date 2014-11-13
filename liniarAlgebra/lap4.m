%for linear algebra course, lab 4
%by Ohad Cohen, 301904520
function lap4
    
    x=-3*pi:.1:3*pi;
    y=y(x);
    k=[1 2 6 12 20];
    
    subplot(2,3,1);
    plot(x,y);
    axis([-7 7 -2 4]);
    text(-6.5,3.5,'original function');
    grid on;
    j=2;
    for i=k
        [a,b]=ab(i);
        f=fouriepol(x,a,b);
        subplot(2,3,j);
        plot(x,y,'.',x,f);
        text(-8,3,['n=',num2str(i)]);
        axis([-10 10 -2 4]);
        grid on;
        j=j+1;
    end
end

%return the value of trigonometric polynom, by operators a & b
%for the whole range (as a vector)
function [y]=fouriepol(range,a,b)
    y=[];
    for x=range
        y=[y,tripol(x,a,b)];
    end
end

%return the value of trigonometric polynom, by operators a & b
%for number x
function [f]=tripol(x,a,b)
    k=0;
    f=0;
    for i=a
        f=f+i*cos(k*x);
        k=k+1;
    end
    k=1;
    for i=b
        f=f+i*sin(k*x);
        k=k+1;
    end
end

%return two vectors of fouriez set
function [a,b]=ab(n)
    %a0/2 = (pi/2)/2 = pi/4,
    %i prefer that than dividingit each time
    a=pi/4; 
    for i=1:n
        a=[a,((-1)^i-1)/(pi*(i^2))];
    end
    b=[];
    for i=1:n
        b=[b,((-1)^(i+1))/(i)];
    end
end

%return the value of f(x) for a single dot
function [f]=f(x)
    x1=mod(x,2*pi);
    if(x1<pi)
        f=x1;
    else
        f=0;
    end
end

%return vector of f(x) values for range
function [y]=y(range)
    y=[];
    for i=range
        y=[y,f(i)];
    end
end