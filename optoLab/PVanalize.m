function [jsc, voc, mxp, f] = PVanalize(volts, current, printFormat)
    if(nargin<3)
        printFormat = '%1.2E';
    end
    jsc = current(abs(volts) == min(abs(volts)));
    jsc=jsc(1);
    voc = volts(abs(current) == min(abs(current)));
    voc=voc(1);
    range = volts >= -1E-2 & volts <= voc;
    P = abs(volts.*current);
    mxp = max(P(range));
    mxp = mxp(1);
    mxv = volts(P == mxp);
    mxv = mxv(1);
    mxc = current(P == mxp);
    mxc = mxc(1);
    range = find(volts>.3);
    %without startpoint, the fit sometimes goes wired.
    f=fit(volts(range), current(range), 'a*exp(b*x)-c', 'startpoint' ,[0, 0, 0]);
    if (nargout < 4)
        plot(volts, current, '+g', 0, jsc, 'Or', voc, 0, 'Ok', mxv, mxc, '*c', volts, (f.a).*exp((f.b).*volts)-f.c);
        xlabel('cell voltage [V]');
        ylabel('output current [A]');
        legend('data points', ['J_{sc} = ', num2str(jsc, printFormat), ' [A]'], ['V_{oc} = ', num2str(voc, printFormat), ' [V]'], ['P_{max} = ', num2str(mxp, printFormat), ', at V=', num2str(mxv, printFormat), ' and J=', num2str(mxc, printFormat)], [num2str(f.a, printFormat),'*e^{',num2str(f.b, printFormat), 'x} - ', num2str(f.c, printFormat)], 2,2)
    end
end