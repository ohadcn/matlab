d=[0 2 4 6 8 10];
ii=[27 18 12 8 6 5];
d=d+2;
dn=[1.5:.1:13];
pol=polyfit(1./d.^2,ii,1);
iif=polyval(pol,1./dn.^2);

pol2=polyfit(1./d(2:6).^2,ii(2:6),1);
iif2=polyval(pol2,1./dn.^2);

%moved to use iif2 because of the far dot
plot(1./d.^2,ii,'+',1./dn.^2,iif);
title('current for 1/r^2');
xlabel('1/r^2 [1/cm^2]');
ylabel('stopping voltage [V]');

figure;
plot(1./d.^2,ii,'+',1./dn.^2,iif2);
title('current for 1/r^2');
xlabel('1/r^2 [1/cm^2]');
ylabel('stopping voltage [V]');

%plot the graph itself
figure;
plot(dn,iif2);
hold on;
errorbar(d,ii,1.5,.5,'.r');
title('current for r');
xlabel('r [cm]');
ylabel('stopping voltage [V]');
hold off;