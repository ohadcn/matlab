classdef rectGuide
    %rectGuide Class represents a rectangular waveguide, with only E_x
    %modes
    %   this class was written by Ohad Cohen <ohadcn@cs.huji.ac.il>,
    %   ID:301904520 for computational ex. 4 in guided waves course.
    
    properties
        d,a,n0,n1,lambda
        kappax, kappay,gammax,gammay, maxk
        bettaxk, bettayk
        neff, b, nxmodes, nymodes
    end
    
    methods
        
        function obj=rectGuide(n0,n1,d,a,lambda)
            if (nargin<5)
                lambda=1.55;
            end
            if (nargin<4)
                a=d;
            end
            
            obj.d=d;
            obj.a=a;
            obj.n0=n0;
            obj.n1=n1;
            obj.lambda=lambda;
            
            k0=2*pi/lambda;
            n2=sqrt(2*n0^2-n1^2);
            obj.maxk=sqrt(n1^2-n0^2)*k0;
            ks=0.005:.00001:obj.maxk;
            
            obj.nxmodes=0;
            p=1;
            while(obj.nxmodes==0)
                modes= @(k) ((p-1)*pi/2+atan(n1^2*sqrt(k0^2*(n1^2-n0^2)-k.^2)./(k*n0^2)))/d;
                diff=ks-modes(ks);
                sols=ks(abs(diff)<.00001);
                if(~isempty(sols))
                    obj.kappax(p)=sols(1);
                    p=p+1;
                else
                    obj.nxmodes=p-1;
                end
            end
            obj.gammax=sqrt(k0^2*(n1^2-n0^2)-obj.kappax.^2);
            obj.bettaxk=sqrt(k0^2*n1^2/2-obj.kappax.^2);
            
            obj.nymodes=0;
            q=1;
            while(obj.nymodes==0)
                modes= @(k) ((q-1)*pi/2+atan(k0*sqrt((n1^2-n0^2))./k))/a;
                diff=ks-modes(ks);
                sols=ks(abs(diff)<.01);
                if(~isempty(sols))
                    obj.kappay(q)=sols(1);
                    q=q+1;
                else
                    obj.nymodes=q-1;
                end
            end
            obj.gammay=sqrt(k0^2*(n1^2-n0^2)-obj.kappay.^2);
            obj.bettayk=sqrt(k0^2*n1^2/2-obj.kappay.^2);
            
        end
        
        function val=isLegalMode(this,p,q)
            val=this.maxk>=sqrt(this.kappax(p)^2+this.kappay(q)^2);
        end
        
        function E=field(this,p,q,x,y)
            if(p>this.nxmodes || q>this.nymodes)
                E=0;
                return;
            end
            ph=(p-1)*pi/2;
            qh=(q-1)*pi/2;
            E=(cos(this.kappax(p).*x-ph).*(abs(x)<=this.d)+ ...
                cos(this.kappax(p).*this.d-ph).*exp(-this.gammax(p)*(abs(x)-this.d)).*(abs(x)>this.d)).* ...
                (cos(this.kappay(q).*y-qh).*(abs(y)<=this.a)+ ...
                cos(this.kappay(q).*this.a-qh).*exp(-this.gammay(q)*(abs(y)-this.a)).*(abs(y)>this.a));
        end
        
        function info(this,p,q,toplot)
            if(nargin<4)
                toplot=0;
            end
            
            betta1=(2*pi/this.lambda)^2*(this.n1^2-this.n0^2)*...
                cos(this.kappax(p)*this.d-(p-1)*pi/2)^2*...
                cos(this.kappay(q)*this.a-(q-1)*pi/2)/...
            ((1+this.gammax(p)*this.d)*(1+this.gammay(q)*this.a));
            betta=sqrt(this.bettaxk(p)^2+this.bettayk(q)^2+betta1^2);
            disp(['mode ',num2str(p*10+q)]);
            disp(['\kappa_x=',9,num2str(this.kappax(p))]);
            disp(['\kappa_y=',9,num2str(this.kappay(q))]);
            disp(['\gamma_x=',9,num2str(this.gammax(p))]);
            disp(['\gamma_y=',9,num2str(this.gammay(q))]);
            disp(['\betta - Kumar=',9,num2str(betta)]);
            disp(['b=',9,num2str(((this.lambda*betta/(2*pi))^2-this.n0^2)/(this.n1^2-this.n0^2))]);
            disp(['\bettta - Marcatili=',9,num2str(sqrt(...
                (2*pi*this.n1/this.lambda)^2-this.kappax(p)^2-...
                this.kappay(q)^2))]);
            
            if(toplot)
                subplot(this.nxmodes,this.nymodes,(p-1)*this.nymodes+q);
                maxx=2*this.d;
                maxy=2*this.a;
                res=.1;
                xs=-maxx:res:maxx;
                ys=-maxy:res:maxy;
                [xx,yy]=meshgrid(xs,ys);
                E=this.field(p,q,xx,yy);
                contourf(xx,yy,E);
                hold on;
                plot([-this.d -this.d this.d this.d -this.d],[-this.a this.a this.a -this.a -this.a],'r');
            end

        end
        
        
        function plot(this)
            set(0,'DefaultTextInterpreter', 'LaTex');
            for p=1:this.nxmodes
                for q=1:this.nymodes
                    this.info(p,q,1);
                end
            end
        end
        
    end
    
end

