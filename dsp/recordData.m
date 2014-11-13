% [y,Fs,bits]=recordData():
% record data at the chosen sampling rate and with the chosen quantization.
% y: the recorded signal
% Fs: the sampling rate of the signal
% bits: the number of bits for quantization

function [y,Fs,bits]=recordData()
Fs=input('sampling rate:');
bits=input('number of quantization bits: ');

recrec=audiorecorder(Fs,bits,1);% sampling rate=Fs, 16 bits, 1 channel
input('press any key to start recording');
recordblocking(recrec,1);
disp(['Done recording'])
y=getaudiodata(recrec);

tt=1:length(y);
tt=tt/Fs; % this is time in seconds

% plot signal
figure;
subplot(2,1,1);
I=find((tt>0.45) & (tt<0.55));
plot(tt(I),y(I));
xlabel('time (sec)');

% plot Fourier transform
yHat=fft(y(50:end));
th=-pi:(2*pi)/(length(yHat)-1):pi;
omega=th*Fs;
subplot(2,1,2);
plot(omega/(2*pi),abs(fftshift(yHat)));xlabel('Freq (Hz)');


dd= 'p';
while (~isempty(regexp(dd,'p')))
    dd=input('(p)lay , (r)ecord again or (e)xit ?     ','s');
    
    if(~isempty(regexp(dd,'e')))
        return;
    elseif(~isempty(regexp(dd,'r')))
       [y,Fs,bits]=recordData();
        break;
    end
    
    p=audioplayer(0.5*y/max(abs(y)),Fs);
    play(p);
    
end

if(nargout <1)
    clear y Fs bits;
end
