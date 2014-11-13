%this file was written by Ohad Cohen & Aviad Eden for ex. 9 in DSP
% function [y]=getMusic(x,Fs,pitch,harmonicsNumber)
%     N = length(x);
%     pitchSize = size(pitch);
%     % number of frequencies that need to be filtered
%     numOfFreqs = pitchSize(1);
%     deltaF = 10/(Fs/2)
%     % initialize the output vector
%     y = zeros(N,1);
%     % initialize output signal helper vector
%     temp = zeros(N,1);
%     % overlap for overcoming the delay caused by filter
%     overlap = round(0.05*Fs);
%     
%     %filter given frequencies (besides last one)
%     for i=1:numOfFreqs-1
%         b = makeFilter(pitch(i,2),Fs,deltaF,harmonicsNumber);
%         begin_i = round(pitch(i,1)*Fs)+1;
%         end_i = round(pitch(i+1,1)*Fs);
%         % takes the frequency played with overlap in time domain
%         if ((begin_i-overlap>0) && (end_i+overlap<=N))
%              temp(begin_i-overlap:end_i+overlap) = filter(b,1,x(begin_i-overlap:end_i+overlap));
%              % trim overlap areas from output signal
%              y(begin_i:end_i) = temp(begin_i:end_i);
%         else
%              y(begin_i:end_i) = filter(b,1,x(begin_i:end_i));
%         end
%         
%     end
%     % filter last frequency
%     lBegin_i = round(pitch(numOfFreqs,1)*Fs);
%     lEnd_i = length(x);
%     l_b = makeFilter(pitch(numOfFreqs,2),Fs,deltaF,harmonicsNumber);
%     temp(lBegin_i-overlap:lEnd_i) = filter(l_b,1,x(lBegin_i-overlap:lEnd_i));
%     y(lBegin_i:lEnd_i) = temp(lBegin_i:lEnd_i);
%     
% 
% end


function [y] =getMusic (x,fs,pitch,harmonicsNumber)
%getMusic This function filters the given sound x using a time variant FIR
%filter.
    N=length(x);
    deltaF = 2/fs;
    parts=length(pitch);
    pitch(parts+1,:)=[N/fs 440];
    y=zeros(N,1);
    overlap=round(0.05*fs);
    for i=1:parts
        start = round(pitch(i,1)*fs)+1;
        stop = round(pitch(i+1,1)*fs);
        fil = makeFilter(pitch(i,2),fs,deltaF,harmonicsNumber,round((stop-start)*fs));
        start = round(pitch(i,1)*fs)+1;
        stop = round(pitch(i+1,1)*fs);
        if ((start-overlap>0) && (stop+overlap<=N))
             temp = filter(fil,1,x(start-overlap:stop+overlap));
             y(start:stop) = temp(overlap:(stop-start+overlap));
        else
             y(start:stop) = filter(fil,1,x(start:stop));
        end
        
    end
end

