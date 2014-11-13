%ex1 in ILS course
%written by Ohad Cohen, <ohadcn@cs.huji.ac.il>, ID:301904520
%this function cumpute the convolution of u={ 1:0>X>T, 0 else}
%with h={x:0>X>T,0 else}
%this script plot the functions and the convulation, each one on 
%it's own plot and all of them in one plot.

function ils1

	precision=.01;
	from=-1;
	to=4;
	T=1;
	padding=.2;
	plotingRange=[from to min([0 T])-padding max([T 1])+padding];
	t=[from:precision:to];

	u=heaviside(t)-heaviside(t-T);
	h=t.*u;
	%keep in mind that conv don't know what you are convoluting, so I must multiply result with precision.
	hu=conv(h,u)*precision;

	subplot(2,2,1);
	plot(t,u);
	xlabel('t');
	ylabel('u');
	axis(plotingRange);

	subplot(2,2,2);
	plot(t,h);
	xlabel('t');
	ylabel('h');
	axis(plotingRange);

	tn=[2*from:precision:2*to];
	subplot(2,2,3);
	plot(tn,hu);
	xlabel('t');
	ylabel('h*u');
	axis(plotingRange);

	subplot(2,2,4);
	plot(t,u,t,h,tn,hu);
	axis(plotingRange);

end
