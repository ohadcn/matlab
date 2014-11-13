%for linear algebra course, lab 3 (v3)
%by Ohad Cohen, 301904520
function lap3
    
    %build f and x
    [x,f]=xy;
    range=-1.5:.05:1.5;
    edge=[-1.5 1.5 -1.5 1.5];
    
    %print the graphs
    n=[1 3 5 15];
    j=1;
    for i=n
       subplot(2,2,j);
       c=pol(i);
       ff=polyval(c,range);
       plot(x,f,'.',range,ff);
       text(-1,1,['n=',num2str(i)]);
       axis(edge);
       grid on;
       j=j+1;
    end
    
    %print the parametrs for n=5
    gramm=gram(5)
    y=y(5)
    c=pol(5)
end

%build x's and f(x) vectors for function f(x)={x<0 ? x^3-x : 0}
%in range -1:.05:1
function [xs,ys]=xy
    x1=-1:.05:0;
    f1=x1.^3-x1;
    x2=.05:.05:1;
    f2=zeros(size(x2));
    xs=[x1,x2];
    ys=[f1,f2];
end

%build aprox. polynom for f(x)=f by n
function [pol] = pol(n)
    g = eye(n)/gram(n);
    y=y(n);
    cc=g*y;
    c=zeros(1,n);
    for i=1:n
        c(i)=cc(n+1-i,1);
    end
    pol=c;
end

%build y's vector for f=x^3-x
function [y] = y(n)
    v=zeros(n,1);
    for i=1:n
        v(i,1) = ((-1)^i)/(i+3)-((-1)^i)/(i+1);
    end
    y=v;
end
    
%build Gramian matrix by size n
function [gram] = gram(n)
    g=zeros(n);
    for i=1:n
        for j=1:n
            if mod(i+j,2)==0
                g(i,j)=2/(i+j-1);
            end
        end
    end
    gram = g;
end