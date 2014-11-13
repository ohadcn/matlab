figure
t1=0:.1:1;
t2=0:.01:1;
t3=0:.001:1;
plot(t1,sin(2*pi*8*t1),'r',t2,sin(2*pi*8*t2),'b',t3,sin(2*pi*8*t3),'g');
title('Q1');
figure;

f0=1/5;
phase=90;
A=.75;
plot(t3,saw(t3,f0,A,phase));
title('Q2+3');

hold on;
plot(t3,exp(-3*t3));
solution=fsolve(@diff,0)
%prints solution =  0.13811, and really saw(0.13811,1/5,0.75,90)=e^-3*0.13811=0.66078


function [a] = saw(x,f0,A,phase)
	if(nargin  < 2)
		f0=1;
	endif
	if(nargin <3)
		A=1;
	endif
	if(nargin<4)
		phase=0;
	endif
	a=2*A.*(mod(x./f0+phase/360,1).-0.5);
end;

function [a]=diff(x,f0,A,phase)
	if(nargin  < 2)
		f0=1/5;
	endif
	if(nargin <3)
		A=.75;
	endif
	if(nargin<4)
		phase=90;
	endif
	a=saw(x,f0,A,phase)-exp(-3*x);
end