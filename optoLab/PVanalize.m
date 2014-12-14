function [jsc, voc, mxp, f] = PVanalize(volts, current, printFormat)
    if(nargin<3)
        printFormat = '%1.2E';
    end
    
    %without startpoint, the fit sometimes goes wired.
    f=fit(volts, current, 'a*exp(b*x)-c', 'startpoint' ,[0, 0, 0]);
    
    vf = 0:.01:2;   %voltage range
    cf = f(vf)';    %current caculated
    rn = find(cf<0);%filter only from voc to jsc
    vf = vf(rn);
    cf = cf(rn);
    jsc = cf(1);
    voc = vf(end);
    P = abs(vf.*cf);
    mxp = max(P);
    mx = find(P == mxp, 1);
    mxv = vf(mx);
    mxc = cf(mx);

    if (nargout < 4)
        plot(volts, current, '+g', 0, jsc, 'Or', voc, 0, 'Ok', mxv, mxc, '*c', volts, (f.a).*exp((f.b).*volts)-f.c);
        xlabel('cell voltage [V]');
        ylabel('output current [A]');
        legend('data points', ['J_{sc} = ', num2str(jsc, printFormat), ' [A]'], ['V_{oc} = ', num2str(voc, printFormat), ' [V]'], ['P_{max} = ', num2str(mxp, printFormat), ', at V=', num2str(mxv, printFormat), ' and J=', num2str(mxc, printFormat)], [num2str(f.a, printFormat),'*e^{',num2str(f.b, printFormat), 'x} - ', num2str(f.c, printFormat)], 2,2)
    end
end