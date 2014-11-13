
%Ex2, Question 4 - Ido Elad, 300204583 
function ex2_ido_elad()
%Print the field
x1 = [-pi:pi/4:2*pi];
x2 = [-pi:pi/4:pi];
[a,b] = meshgrid(x1,x2);
quiver(a,b,b,-sin(a))
xlabel('x_1')
ylabel('x_2')

%Results
hold on
dt = 0.01;
T = 10;
[x1a,x2a] = mypendulum2(pi/8,0,dt,T);
[x1b,x2b] = mypendulum2(pi/8,pi/8,dt,T);
[x1c,x2c] = mypendulum2(7*pi/8,0,dt,T);
[x1d,x2d] = mypendulum2(0,0,dt,T);
plot(x1a,x2a,'-r');
plot(x1b,x2b,'--g');
plot(x1c,x2c,'-.c');
plot(x1d,x2d,':m');

legend('field','<x_1(0),x_2(0)> = <pi/8,0>','<x_1(0),x_2(0)> = <pi/8,pi/8>','<x_1(0),x_2(0)> = <7*pi/8,0>','<x_1(0),x_2(0)> = <0,0>');
end



%Euler function
function [x1,x2] = mypendulum2(x1_0,x2_0,dt,T)
t=0:dt:T;
l=length(t);
x1 = zeros(1,l);
x2 = zeros(1,l);
x1(1) = x1_0;
x2(1) = x2_0;
for i=2:l
    x1(i) = x1(i-1) + dt*x2(i-1);
    x2(i) = x2(i-1) + dt*(-sin(x1(i-1)));
end
end
