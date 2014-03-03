%% get Meta Data
% objective : extract features from FBA subset for further segmentation tasks     
%
% Chih-Wei Wu, GTCMT, 2014/03
clear all; clc; close all;
profile on;

%set parameters
windowSize = 2^nextpow2(1024); 
hopSize = round((1/4)*windowSize); 
w = hann(windowSize); %hann window

%initalization
dataCount = 0;

%get data dir
[dataDir, annDir] = readPath;
L = length(dataDir);

for j = 1:L    
%read folder information
[dataInfo, annInfo, flag] = readFile(dataDir{j}, annDir{j});
trackNum = length(dataInfo);

tic;
for i = 1:trackNum
%============== Signal input ==============
%load individual data name from the folder
    filename = dataInfo(i).path;
    annName = annInfo(i).path;

%load wave file
    [x, fs] = wavread(filename); 
    x = mean(x,2); %down-mixing   
    [annotation] = annRead(annName, flag);
    
    dataCount = dataCount + 1;

    
    
end


end
toc;

fprintf('Total %d files to compute\n', dataCount);