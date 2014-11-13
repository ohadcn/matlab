function [Hd] = makeFilter (f,fs,deltaF,harmonicsNumber)
%This function makes a multi-band FIR filter.
%
%Inputs:
%f - The first harmonic frequency. (which will be the value taken from the
%pitch vector)
%fs - sampling rate (which is one of the outputs of wavread )
%deltaF - the width of the pass band. (normalized between 0 to 1)
%harmonicsNumber - number of harmonics used.
%You can add optional inputs to this function if needed (such as N, the filters
%order) but they should all have default values. (the function exCheck.m
%should work as is)
%
%Outputs:
%Hd - is a FIR filter. It can be an object or the verctor b of a FIR filter.
%You can use the function freqz to view your filter.
%Using these FIR filters we will separate the harmonics from the background.

% n=200 seems to be enough for our purpose.
N = 200;
winType = 'rectwin';
w = zeros(2*harmonicsNumber,1);
f= 2*f/fs;
count=1;
%creating the positions vector:
for i = 1:2:harmonicsNumber*2
    w(i) = f*count - deltaF/2;
    w(i+1) = f*count + deltaF/2;
    count=count+1;
end
Hd = fir1(N,w,'DC-0',feval(winType,N+1));  
end

