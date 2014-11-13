function [x1,x2] = mypendulum(x1_0,x2_0,dt,T)
	t=[0:dt:T];
	x1=zeros(length(t),1);
	x2=zeros(length(t),1);
	x1(1)=x1_0;
	x2(1)=x2_0;
	n=2;
	for i=t
		x1(n)=x1(n-1)+dt*x2(n-1);
		x2(n)=x2(n-1)-dt*sin(x1(n-1));
		n=n+1;
	end
end