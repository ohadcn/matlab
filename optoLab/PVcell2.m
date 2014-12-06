%% this script save the data for a givven temp into fits and cur (current)
echo off;
files=dir('*light.csv');
len=size(files,1);

fig = figure;
hold all;

fits=cell(len);
curs=cell(len);

for i=1:len
    file=files(i);
    disp(file.name)
    [volts, current] = readDataPV(file.name);
    [jsc, voc, mxp, f] = PVanalize(volts, current);
    fits{i} = f;
    curs{i}=current;
    plot(volts, current, 'DisplayName', regexprep(file.name, '[lL]ight.csv', '^oC'))
end
legend('-DynamicLegend', 2, 2)
title('Current for Voltage in different tempratures, on full light')
xlabel('Voltage [V]')
ylabel('Current [A]')
saveas(fig, 'c4vInLight.jpg')
