%tabcomplete gaussImage file
function [a, b, c] = gaussImage(filename, range)
    if (nargin == 1)
        range = -50:50;
    end
    im = imread(filename);
    mx = max(im);
    sz=size(im);
    sz=sz(2);
    p = find(mx == max(mx));
    p = p(1);
    range2 = p+range;
    range2 = range2(range2 > 0 & range2 <= sz);
    fi=fit(range2', double(mx(range2)'),'gauss1');
    
    if(nargout == 3)
        a=fi.a1;
        b=fi.b1;
        c=fi.c1;
    else
        a=fi;
    end
end