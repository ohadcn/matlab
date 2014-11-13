 d=[2 4 6 8 10 12 14 16];
 ii=[27 18 12 8 5 3 1 -0.5];
 dn=1:.1:16;
 pol=polyfit(d,ii,2);
 iif=polyval(pol,dn);
 plot(d(1:6),ii(1:6),'+',dn,iif);
 xlabel('Distance (cm)')
 ylabel('Current - no voltage (nA)')
 title('Base current to distance')
 grid on
 text(11,26,['I=',num2str(pol(3)),'/r^2'])
 nd=1./d;
 dp=0:.1:1;
 pol=polyfit(nd,ii,1);
 dif=polyval(pol,dp);
 plot(nd(1:6),ii(1:6),'+',dp,dif);
