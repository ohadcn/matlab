clf
hold off
fi=pi/9;
n=18;
p=3;
c=cos(fi);
s=sin(fi);
x=[1,0];
for i=1:n
    plot([0,x(1)],[0,x(2)])
    axis([-1.5,1.5,-1.5,1.5])
    x=[c*x(1)-s*x(2),s*x(1)+c*x(2)];
    wait(10000)
end
