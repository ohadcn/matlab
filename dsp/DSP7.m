N=100;
T=0.01;


t=((0:N-1)*T)';
x=cos(2*pi*t);
f=(0:N-1)-N/2;

figure('Color','white');

% Rectangular
subplot(2,4,1);
plot(f,abs(fftshift(fft(x.*rectwin(N)))));
ylabel('FFT Rect');

% Bartlet
subplot(2,4,2);
plot(f,abs(fftshift(fft(x.*bartlett(N)))));
ylabel('FFT Bartlet');
title('Ohad Cohen & Aviad Eden');

% Hann
subplot(2,4,3);
plot(f,abs(fftshift(fft(x.*hann(N)))));
ylabel('FFT Hann');

% Blackman
subplot(2,4,4);
plot(f,abs(fftshift(fft(x.*blackman(N)))));
ylabel('FFT Blackman');

% Kaiser 
% a=1
subplot(2,4,5);
plot(f,abs(fftshift(fft(x.*kaiser(N,1)))));
ylabel('FFT Kaiser 1');

% a=4
subplot(2,4,6);
plot(f,abs(fftshift(fft(x.*kaiser(N,4)))));
ylabel('FFT Kaiser 4');

% a=10
subplot(2,4,7);
plot(f,abs(fftshift(fft(x.*kaiser(N,10)))));
ylabel('FFT Kaiser 10');
