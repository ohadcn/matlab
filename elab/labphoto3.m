i=[27 22 16 12 8.5 6 3.5 2 1 .5 0];
v=[0 99 200 303 399 501 599 701 799 900 930];
pol=polyfit(v,i,2);
vf=0:1:1000;
in=polyval(pol,vf);
plot(v,i,'+',vf,in);
xlabel('V (mV)');
ylabel('I (nA)');
title('current as function of the voltage');