
hold on

%the code in the ex. desp
x1=[-pi:pi/4:2*pi];
x2=[-pi:pi/4:pi];
[a,b]=meshgrid(x1,x2);
quiver(a,b,b,-sin(a));
xlabel('x_1');
ylabel('x_2');

dt=.01;
T=10;
x1=[pi/8 pi/8 7*pi/8 0];
x2=[0 pi/8 0 0];
plotpar=['-','--','.','.-.'];
for i=1:4
	plot(mypendulum(x1(i),x2(i),dt,T),plotpar(i));
end