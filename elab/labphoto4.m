l=[405 435 546 577].*(10^-9);
vs=[1030 900 400 330].*(10^-3);
c=3*10^8;
f=c./l
pol=polyfit(f,vs,1)
nea=0:10^13:1*10^15;
vsf=polyval(pol,nea);
plot(f,vs,'+',nea,vsf);
xlabel('frequency (Hz)');
ylabel('stopping voltage (V)');
title('stopping voltage as function of light frequency');
