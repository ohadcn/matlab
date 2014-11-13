n1=1.5;
n2=1.47;
n3=1.45;
d=6;
l=1.55;
k0=2*pi/l;
maxk=sqrt((n1^2-n2^2)*k0^2);
k=0.005:.0001:maxk;%don't start from 0 to avoid it from solutions.
slab= @(k) (k*d.*(sqrt((n1^2-n2^2)*((d*k0)^2)-((k*d).^2))+sqrt((n1^2-n3^2)*((d*k0)^2)-((k*d).^2))))./((k*d).^2-sqrt((n1^2-n2^2)*((d*k0)^2)-((k*d).^2)).*sqrt((n1^2-n3^2)*((d*k0)^2)-((k*d).^2)));
slabs=real(slab(k));
dif= tan(d*k)-slabs;
sols=find(abs(dif)<.001);
figure(1)
plot(k,tan(d*k),k,slabs,k(sols),slabs(sols),'*')
axis([0 maxk -5 5]);

set(0,'DefaultTextInterpreter', 'LaTex');
disp('results: ');
kappa=k(sols);
betta=sqrt((k0*n1)^2-kappa.^2);
gamma=sqrt((k0^2)*(n1^2-n2^2)-kappa.^2);
neff=betta/k0;
disp(['\kappa=',9,num2str(kappa)]);
disp(['\betta=',9,num2str(betta)]);
disp(['\gamma=',9,num2str(gamma)]);
disp(['n_eff=',9,num2str(neff)]);
disp 'As you can see in the table, as \kappa raises, less of the wave velocity is going towards the wave direction, so \betta and n_eff are becoming smaller and smaller.'
disp 'keep in mind that n_eff cannot go below n_2, as it will cause the wave to get out of the guide'

figure(2)
d2=d*kappa(1)/kappa(2);%since the right part of equation (slab function) is not depends on d, and since d is always multiplied by kappa kappa is limited to less than maxk, we can just multiply d by kappa_1/kappa_2 and get obly one solution.
plot(k,tan(d2*k),k,slabs)
axis([0 maxk -5 5]);
dif2= tan(d2*k)-slabs;
disp(['Q2: The maximal thickness for the slab guide with one mode only is ',num2str(floor(d2*10)/10),'\mu m.'])
disp(['the mode for that thickness is \kappa=',num2str(k(find(abs(dif2)<.001))),'.'])
