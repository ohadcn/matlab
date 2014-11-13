function [ seq ] = identifyPhoneSeq( filename )
%identifyPhoneSeq gets a file, and analyze the number sequence corresponed
%to it.
%   [ seq ] = identifyPhoneSeq( filename ) - Analyze file filename, and
%   returns the sequence of the numbers that were dialed.
	
	%Receive the WAV seq
	[x,fs,bits]=wavread(filename);
	j=1;
	i=1;
	%The size of a "chunk" - a single tune - is (the number of samples for sec)*(length of a tone [0.1 sec])
	chunk=round(fs*0.1);
	%White noise will be less than half of the real tones	
	cut=max(x)/2;
	%Goes over the WAV and look for tones. Each tone is being sent to be processed by the "identifyPhoneTones"
	while(i<length(x))
		if(x(i)>cut)
			seq(j)=identifyPhoneTones(x(i:i+chunk),fs);
			j=j+1;
			i=i+round(1.5*chunk);
        	end
        	i=i+1;
	end
end

