%   this script was written by Ohad Cohen <ohadcn@cs.huji.ac.il>,
%   ID:301904520 for computational ex. 4 in guided waves course.


%% Q1
r=rectGuide(1.47,1.5,5,6,1.55);
r.plot();


%% Q2
for h=4:8
    disp(['for h=',num2str(h)]);
    r=rectGuide(1.458,1.47,h);
    r.info(1,1);
    
    maxx=2*h;
    maxy=2*h;
    res=.1;
    xs=-maxx:res:maxx;
    ys=-maxy:res:maxy;
    [xx,yy]=meshgrid(xs,ys);
    E=r.field(1,1,xx,yy);
    E=E./sqrt(sum(sum(E.^2)));  %normalization
    
    Ec=exp(-(xx.^2+yy.^2)/5.25.^2).*((xx.^2+yy.^2)<h^2);
    Ec=Ec./sqrt(sum(sum(Ec.^2)));  %normalization
    
    coup=sum(sum(E.*Ec));
    disp(['\nea^2=',num2str(coup^2)]);
    if(r.nxmodes*r.nymodes>1)
        disp(['h=',num2str(h),' has ',num2str(r.nxmodes*r.nymodes),' modes']);
    end

end