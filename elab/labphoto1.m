l=[405 435 546 577];
vs=[930 850 570 400];
pol=polyfit(l,vs,1);
vsf=polyval(pol,l);
plot(l,vs,'+',l,vsf);