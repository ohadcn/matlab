 d=[0 2 4 6 8 10];
 ii=[27 18 12 8 6 5];
 dn=0:.1:10;
 pol=polyfit(d,ii,2);
 iif=polyval(pol,dn);
 plot(d,ii,'+',dn,iif);