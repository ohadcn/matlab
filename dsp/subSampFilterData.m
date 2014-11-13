
% subSampFilterData(y,Fs):
% Sub-sample the given signal after applying a low-pass filter, plot the Fourier transform and play the
% resulting signal.
%
% y:  the given signal
% Fs: the original sampling rate

function subSampFilterData(y,Fs)

rr=input('subsampling rate ');
[yy,bb]=resample(y,1,rr); % used to calculate the correct low-pass filter (bb)
y2B=conv(y,bb,'same');  % low-pass filter
tt=1:length(y);
tt=tt/Fs; % this is time in seconds
fprintf('Effective sampling rate: %d\n',Fs/rr);

% plot new signal
figure;
subplot(3,1,1);
I=find((tt>0.45) & (tt<0.55));
plot(tt(I),y2B(I));
title('Time domain')
xlabel('time (sec)');
subplot(3,1,2);

% plot Fourier transform
yHat=fft(y2B(50:end));
th=-pi:(2*pi)/(length(yHat)-1):pi;
omega=th*Fs;
subplot(3,1,2);
plot(omega/(2*pi),abs(fftshift(yHat)));xlabel('Freq (Hz)');
title('Fourier of filtered signal before sampling')
subplot(3,1,3);
y2B=0*y;
y2B(1:rr:end)=yy;
yHat=fft(y2B(50:end));
plot(omega/(2*pi),abs(fftshift(yHat)));xlabel('Freq (Hz)');
title('Fourier of filtered signal after sampling')
hold on;
cutOff=0.5*(Fs/rr);
plot([cutOff cutOff],[0 max(abs(yHat))],'r');
plot([-cutOff -cutOff],[0 max(abs(yHat))],'r');


dd= 'p';
while (~isempty(regexp(dd,'p', 'once')))
    dd=input('(p)lay , (r)esample again or (e)xit ?     ','s');
    
    if(~isempty(regexp(dd,'e', 'once')))
        return;
    elseif(~isempty(regexp(dd,'r', 'once')))
        subSampFilterData(y,Fs);
        break;
    end
    
        p=audioplayer(0.5*yy/max(abs(y)),Fs/rr);
    play(p);
    
end

