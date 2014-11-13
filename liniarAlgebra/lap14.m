clear;
clf;

%initializing vars 
x=[0 1.1 2.2 3.3 4.4];
 y=[0 0.2 1 2.2 3.8];
 z=[3 3 0 1 1];
 v=[0 0 0 0 1];
 u=[2 3 2 0 1];
 
 %create the matrix
 e=eye(5);
 c=[];
 for i=1:length(x),
     c=[c;polyfit(x,e(i,:),3)];
 end
 c=c
 
 cy=y*c
 cz=z*c
 cu=u*c
 cv=v*c
 
 min=-2;
 max=6;
 diff=.01;
 range=min:diff:max;
 
 subplot(2,2,1);
 plot(x,y,'*',range,polyval(cy,range),'-');
 axis([min max min max]);
 
 subplot(2,2,2);
 plot(x,z,'*',range,polyval(cz,range),'-');
 axis([min max min max]);
 
 subplot(2,2,3);
 plot(x,u,'*',range,polyval(cu,range),'-');
 axis([min max min max]);
 
 subplot(2,2,4);
 plot(x,v,'*',range,polyval(cv,range),'-');
 axis([min max min max]);
