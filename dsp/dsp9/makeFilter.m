%this file was written by Ohad Cohen & Aviad Eden for ex. 9 in DSP
function [Hd] = makeFilter(f,fs,deltaF,harmonicsNumber,N)
%makeFilter This function makes a multi-band FIR filter.
    if (nargin<5)
        N = 5000;
    end
    winType = 'hamming';
    freq=2*f/fs;
    h=1:harmonicsNumber;
    w=sort([(h*freq-deltaF),(h*freq+deltaF)]);
    Hd = fir1(N,w,'DC-0',feval(winType,N+1));
end