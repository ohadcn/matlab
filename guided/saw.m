function [a] = saw(x,f0,A,phase)
	if(nargin == 1)
		f0=1;
	endif
	if(nargin <3)
		A=1;
	endif
	if(nargin<4)
		phase=0;
	endif
	a=2*A.*(mod(x./f0.+phase/360,1).-0.5);
end;