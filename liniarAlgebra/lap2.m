x=-1:.25:3;
f=exp(x/2).*sin(x);
df=exp(x/2).*sin(x)/2+exp(x/2).*cos(x);
c5=polyfit(x,f,5)
a=zeros(6);
for i=1:5
    a(i+1,i)=6-i;
end
a=a
c5t=c5'
dc5=a*c5t
dc5t=dc5'
plot(x,f,'--',x,df,'.',x,polyval(dc5,x),'-');
axis([-1.3,3.3,-5.5,3.5]);
grid;