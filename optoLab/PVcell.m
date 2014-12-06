%% generate graphs from data readed in PV cell experiment
%  the graphs are saved in jpg and fig format, and contains the data, 
%  exponential fit, P_max, J_sc and V_oc  (numerical in legend and on graph).

echo off;
files=dir('*.csv');
fig = figure;
for file=files'
    disp(file.name)
    [volts, current] = readDataPV(file.name);
    PVanalize(volts, current);
    title(regexprep(regexprep(strrep(file.name, '.csv', ''), '[0-9.]+', ' $0 '), ' ([0-9.]+)', '$1^oC', 'once'));
    saveas(fig, strrep(file.name, 'csv','jpg'));
    saveas(fig, strrep(file.name, 'csv','fig'));
end
