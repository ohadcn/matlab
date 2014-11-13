classdef slab
    %slab this class represents a slab waveguide.
    %   currently this class support only TE modes.
    %   this class was written by Ohad Cohen <ohadcn@cs.huji.ac.il>,
    %   ID:301904520 for computational ex. 3 in guided waves course.
    
    properties
        width, lambda
        n1, n2, n3
        nmodes %number of available modes
        betta, kappa, gamma, delta, neff %vectors, for all the solutions
    end
    
    methods
        function obj=slab(d, lambda, n1, n2, n3)
            if (nargin<5)
                n3=n2;
            end
            obj.width=d;
            obj.lambda=lambda;
            obj.n1=n1;
            obj.n2=n2;
            obj.n3=n3;
            
            k0=2*pi/lambda;
            maxk=sqrt((n1^2-n2^2)*k0^2);
            ks=0.005:.00001:maxk;%don't start from 0 to avoid it from solutions.
            slab= @(k) (k.*(sqrt((n1^2-n2^2)*((k0)^2)-((k).^2))+...
                sqrt((n1^2-n3^2)*((k0)^2)-((k).^2))))./((k).^2-...
                sqrt((n1^2-n2^2)*((k0)^2)-((k).^2)).*sqrt((n1^2-n3^2)*...
                ((k0)^2)-((k).^2)));
            slabs=real(slab(ks));
            dif= tan(d*ks)-slabs;
            sols= abs(dif)<.001;
            obj.kappa=unique(round(ks(sols)*1000))/1000;
            obj.betta=sqrt((k0*n1)^2-obj.kappa.^2);
            obj.gamma=sqrt((k0^2)*(n1^2-n2^2)-obj.kappa.^2);
            obj.delta=sqrt((k0^2)*(n1^2-n3^2)-obj.kappa.^2);
            obj.neff=obj.betta/k0;
            obj.nmodes=length(obj.kappa);
        end
        
        
        function modesGraph(s, print)
            k0=2*pi/s.lambda;
            maxk=sqrt((s.n1^2-s.n2^2)*k0^2);
            ks=0.005:.00001:maxk;
            slab= @(k) (k.*(sqrt((s.n1^2-s.n2^2)*((k0)^2)-((k).^2))+...
                sqrt((s.n1^2-s.n3^2)*((k0)^2)-((k).^2))))./((k).^2-...
                sqrt((s.n1^2-s.n2^2)*((k0)^2)-((k).^2)).*...
                sqrt((s.n1^2-s.n3^2)*((k0)^2)-((k).^2)));
            slabs=real(slab(ks));
            dif= tan(s.width*ks)-slabs;
            sols= abs(dif)<.001;
            plot(ks,tan(s.width*ks),ks,slabs,ks(sols),slabs(sols),'*');
            axis([0 maxk -5 5]);
            if(nargin >1 && print)
                set(0,'DefaultTextInterpreter', 'LaTex');
                disp('results: ');
                disp(['\kappa=',9,num2str(s.kappa)]);
                disp(['\betta=',9,num2str(s.betta)]);
                disp(['\gamma=',9,num2str(s.gamma)]);
                disp(['\delta=',9,num2str(s.delta)]);
                disp(['n_eff=',9,num2str(s.neff)]);
            end
        end
        
        
        function E=field(s, x, m, A)
            %currently, normalization do not work when B<>0
            if(nargin<3)
                m=1;
            end
            if(nargin<4)
                inte = @(y) (s.field(y, m, 1).^2);
                norm=integral(inte,-100,100);%inf sometimes do problems                
                A=1/norm;
            end            
            if(m>s.nmodes || m<1)
                disp(['error: maximal mod is ',num2str(s.nsols)]);
                E=0;
                return;
            end
            B=A*(tan(s.kappa(m)*s.width/2)-s.delta(m)/s.kappa(m))/(1+tan(s.kappa(m)*s.width/2)*s.delta(m)/s.kappa(m));
            C=exp(s.gamma(m)*s.width/2).*(A*cos(s.kappa(m)*s.width/2)+...
                B*sin(s.kappa(m)*s.width/2));
            F=exp(s.delta(m)*s.width/2).*(A*cos(s.kappa(m)*s.width/2)-...
                B*sin(s.kappa(m)*s.width/2));
            
            E = F*exp(s.delta(m)*x).*(x<-s.width/2)+...
                (A*cos((s.kappa(m))*x)+B*sin((s.kappa(m))*x)).*...
                (and(x<=s.width/2, x>=-s.width/2))+...
                C*exp(-s.gamma(m)*x).*(x>s.width/2);
        end
        
        
        function plotField(s, x, m, A)
            if(nargin<3)
                m=1;
            end
            if(nargin<4)
                E=s.field(x, m);
            else
                E=s.field(x, m, A);
            end
            if(not(E))
                disp('an error occured')
                return
            end
            
            background=-s.width/2:.0001:s.width/2;
            plot(background,sin(1000*background),'Color',[0.95 0.95 0.95]);
            hold on
            plot(x,E);
            axis([min(x) max(x) min(E) max(E)])
        end
    end
    
end

