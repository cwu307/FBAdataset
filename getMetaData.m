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


%get data dir
[dataDir, annDir] = readPath;
L = length(dataDir);

tic;
for j = 1:L    
%read folder information
[dataInfo, annInfo, flag] = readFile(dataDir{j}, annDir{j});
trackNum = length(dataInfo);

for i = 1:trackNum
%============== Signal input ==============
%load individual data name from the folder
    filename = dataInfo(i).path;
    annName = annInfo(i).path;
    fprintf('Working on data #%g...\n',i);
    fprintf('Current audio file name      = %s \n', dataInfo(i).name);
    fprintf('Current annotation file name = %s \n', annInfo(i).name);
    

%load wave file
    [x, fs] = audioread(filename); 
    x = mean(x,2); %down-mixing   
    [annotation] = annRead(annName, flag);
    
%============== Feature Extraction ==============    
    %compute all features
    [vsc] = mySpectralCentroid(x, fs, windowSize, hopSize); %feature 1
    [vMaxAmp] = myMaxAmp(x, windowSize, hopSize); %feature 2
    [vzc] = myZCR(x, windowSize, hopSize); %feature 3
    [vtsc] = mySpectralCrest(x, windowSize, hopSize); %feature 4
    [vsf] = mySpectralFlux(x, windowSize, hopSize); %feature 5
    %build a feature matrix
    v = [vsc; vMaxAmp; vzc; vtsc; vsf];
    
 
    
% %============== Plot the results ==============
%     [locInSamples, locInFrames] = annToLoc(annotation, windowSize, hopSize, fs);
    
    


    
%============== Store MetaData ==============    
    subsetFBA{i} = {v; annotation};



    
end


end
toc;

clearvars -except subsetFBA
save 'subsetFBA.mat'











