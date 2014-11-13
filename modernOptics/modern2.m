function modern2()
	range = 10;
	dist=.1;
	vec=-range:dist:range;
    [x,y]=meshgrid(vec);
    z=triangle(x,y,2);
    f=abs(fftshift(fft2(z)).^2)*dist^4;
    surf(x,y,f);
    colorbar;
	figure
	imagesc(vec,vec,f);
%    figure
%    surf(x,y,z);
%    colorbar;
    function [a] = ring(x,y,r1,r2)
        if(nargin<3)
            r1=2;
        end
        if(nargin<4)
            r2=3;
        end
        r=sqrt(x.^2+y.^2);
        a=(r<r2).*(r>r1);
    end


    function [b]=triangle(x,y,a)
        if(nargin<3)
            a=1;
        end
        b=(y>-a/sqrt(12)) .* (y<sqrt(3)*a.*x+1/sqrt(3)) .* (y<-sqrt(3)*a.*x+1/sqrt(3));
    end
end