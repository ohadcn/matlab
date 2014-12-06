function [volts, currents] = PVreadData(filename)
%% readDataPV Function, reads data from PV cell experiment equipment
%% and retrive the volt-current data from it.
%% before running this function, you should edit the csv file to replace
%% all infinity occurance with "inf" string, on unix systems this can be
%% done easily using sed tool:
%% sed -i bak s/infinity/inf/gi
%% written by Ohad Cohen <ohadcn@cs.huji.ac.il>

    %don't show those warnings, but restore their status after runing.
    UnsupportedEncoding = warning('off', 'MATLAB:iofun:UnsupportedEncoding');
    InvalidRowsAndColumns = warning('off', 'MATLAB:dlmread:InvalidRowsAndColumns');
    fullcsv = csvread(filename, 2,2, 'C3..H63');
    warning(InvalidRowsAndColumns);
    warning(UnsupportedEncoding);
    volts = fullcsv(1:2:end, 1);
    currents = fullcsv(1:2:end, 6);
end