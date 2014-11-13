function [ number ] = identifyPhoneTones( x,fs )
%identifyPhoneTones Recives a sampled phone tone
%   and returns the corresponding number
%   [ number ]=identifyPhoneTones( x,fs ) - get a phone tone sampled at
%   rate fs, and retuns the corresponding number
%
%	identifyPhoneTones is doing DFT to the signal, and than looks for the
%	the strengh of the frequencies used at phone tones in the transformed
%	signal to determine which frequencies used and hence - what is the
%	corresponding number.
	
	%Lists of the numbers and freq's by order (rr=Freq row, fc=Freq col)
	nums=[1 2 3;4 5 6; 7 8 9; 10 0 11];
	fr=[697 770 852 941];
	fc=[1209 1336 1477];
	
	%f is the Fourier Transform of the sample. It is used to find the frequencies that are being used.
	%The shift is used to center the frequencies around 0	
	f=abs(fftshift(fft(x)));
	
	%The cut frequencies. Is used to "clean" white noise that is less than third(at least) of the real frequencies.
	cut=max(f)/3;

	%Goes over the wanted frequencies and check if they were "used"
	%We also checked one(frequency) to the left and one to the right because the sample isn't long enough so the frequencies aren't exact. 
	for i=1:4
		freq=round(fr(i)/10+length(f)/2);
		if(max(f(freq-1:freq+1))>cut)
			row=i;
		end
	end

	for i=1:3
		freq=round(fc(i)/10+length(f)/2);
		if(max(f(freq-1:freq+1))>cut)
			col=i;
		end
	end
	number=nums(row,col);
end

