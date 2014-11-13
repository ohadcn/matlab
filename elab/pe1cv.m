i=[27 22 16 12 8.5 6 3.5 2 1 .5 0];
v=[0 99 200 303 399 501 599 701 799 900 930];
errorbar(v,i,1,.5,'.')
xlabel('V (mV)');
ylabel('I (nA)');
title('current as function of the voltage');