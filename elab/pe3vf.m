l=[404 436 546 577].*(10^-9);
vs=[1030 900 400 330].*(10^-3);
c=3*10^8;
f=c./l
pol=polyfit(f,vs,1)
nea=0:10^13:1.3*10^15;
vsf=polyval(pol,nea);
errorbar(f,vs,.05,.05,'+.');
hold on;
plot(nea,vsf,'r');
xlabel('frequency (Hz)');
ylabel('stopping voltage (V)');
title('stopping voltage as function of light frequency');
hold off;
text(1E14,2,['v=',num2str(pol(1)),'f',num2str(pol(2))]);