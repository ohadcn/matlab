function [y] =getMusic (x,fs,pitch,harmonicsNumber)
 
%This function filter the given sound x using a time variant FIR filter.
%The function has four inputs:
%x - a vector with the signal
%fs - the sample rate (the first two inputs are similar to the output of
%wavread )
%pitch - a 2 dimensional vector. The first column contains a timestamp (in
%seconds) while the second one is the first harmonic frequency (in Hz). For
%
%The output y is the filtered signal.

deltaF = 1*2/fs;
[r,~] = size(pitch);
[xsize,~] = size(x);
y = zeros(xsize,1);
totTime = xsize/fs;
pi = zeros(r+1,2);
pi(1:r,:) = pitch;
pi(r+1,:) = [totTime,pitch(r,2)];

%as we saw in class there is a delay once you use a filter. In order
%overcome the delay of using the filter we overlap the sections when we filter them.
for i=1:r
    if (i==1 || i== r)
        %if this is the first or the last one, no need to filter.
        tempX = x(int32(pi(i,1)*fs+1): int32(round(pi(i+1,1)*fs)));
        tempY = conv(tempX,makeFilter (pi(i,2),fs,deltaF,harmonicsNumber),'same');
    else
        tempX = x(int32(pi(i,1)*fs - 0.1*fs +1): int32(round(pi(i+1,1)*fs + 0.1*fs)));
        tempY = conv(tempX,makeFilter (pi(i,2),fs,deltaF,harmonicsNumber),'same');
        tempY = tempY(0.1*fs +1: end - 0.1*fs);
    end
   y(int32(pi(i,1)*fs+1): int32(round(pi(i+1,1)*fs))) = tempY;
end
end

