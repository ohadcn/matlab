n=15;
g=zeros(n); 
for i=1:n
    for j=1:n
        if round((i+j)/2)==(i+j)/2,
            g(i,j)=2/(i+j-1);
        end
    end
end
y=zeros(n,1);
for i=1:n
    y(i,1)=(1/(i+1)-1/(i+3))*((-1)^(i+1));
end
cc=(g^(-1))*y;
c=zeros(1,n);
for i=1:n
    c(i)=cc(n-i+1,1);
end
x1=-1:.1:0;
f1=x1.^3-x1;
x2=.1:.1:1;
f2=0*x2;
x=[x1,x2];
f=[f1,f2];
xx=-1.5:.05:1.5;
ff=polyval(c,xx);

plot(x,f,'.',xx,ff)
axis([-1.5,1.5,-1.5,1.5])
grid on