%   this script was written by Ohad Cohen <ohadcn@cs.huji.ac.il>,
%   ID:301904520 for computational ex. 3 in guided waves course.



clear
%it's nicer, and highlights the gray back of core
figure('Color',[1 1 1]);
 x=-10:.0001:10;

%I took only the symmetric modes (those with A<>0, B=0)

%-----part A: find modes for slab A, and plot them.
a=slab(4,1.55,1.452,1.44,1.44);
for i=1:a.nmodes
    subplot(2,2,i)
    a.plotField(x,i);
    title(['slab a, mod ',num2str(i)]);
end


%-----part B: find modes for slab B, and plot them.
b=slab(6,1.55,1.5,1.47,1.45);
for i=1:b.nmodes
    subplot(2,2,a.nmodes +i)
    b.plotField(x,i);
    title(['slab b, mod ',num2str(i)]);
end

%-----part C: find linkage coefficient for slabs A & B
for i=1:a.nmodes
    for j=1:b.nmodes
        func=@(y) (a.field(y,i).*b.field(y+3,j));
        ni=integral(func,-100,100);
        disp(['the coefficient for i=',num2str(i),' j=',num2str(j),' is: ',num2str(ni)]);
    end
end