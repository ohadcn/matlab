
% subSampData(y,Fs):
% Sub-sample the given signal, plot the Fourier transform and play the
% resulting signal.
%
% y:  the given signal
% Fs: the original sampling rate

function subSampData(y,Fs)



rr=input('subsampling rate ');
y2=y(1:rr:end);
y2B=0*y;
y2B(1:rr:end)=y2;
tt=1:length(y);
tt=tt/Fs; % this is time in seconds
fprintf('Effective sampling rate: %d\n',Fs/rr);

% plot signal
figure;
subplot(2,1,1);
I=find((tt>0.45) & (tt<0.55));
plot(tt(I),y2B(I));
xlabel('time (sec)');
subplot(2,1,2);



% plot Fourier transform
yHat=fft(y2B(50:end));
th=-pi:(2*pi)/(length(yHat)-1):pi;
omega=th*Fs;
subplot(2,1,2);
plot(omega/(2*pi),abs(fftshift(yHat)));xlabel('Freq (Hz)');
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
        subSampData(y,Fs);
        break;
    end
    
     p=audioplayer(0.5*y2/max(abs(y2)),Fs/rr);
    play(p);
    
end



