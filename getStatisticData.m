%% get statistic Data
% objective : for every track, measure the distribution of every part     
%
% Chih-Wei Wu, GTCMT, 2014/03
clear all; clc; close all;
profile on;

%set parameters
windowSize = 2^nextpow2(1024); 
hopSize = round((1/4)*windowSize); 
w = hann(windowSize); %hann window

%initalization
startTime  = zeros(7, 30);
occupyArea = zeros(7, 30);

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
    [locInSamples, locInFrames] = annToLoc(annotation, windowSize, hopSize, fs);
    audioLenInSamples = length(x);
    
    
    
%============== Store MetaData ==============    
    startTime(1, i) = locInSamples(1) / audioLenInSamples;
    startTime(2, i) = locInSamples(3) / audioLenInSamples;
    startTime(3, i) = locInSamples(5) / audioLenInSamples;
    startTime(4, i) = locInSamples(7) / audioLenInSamples;
    startTime(5, i) = locInSamples(9) / audioLenInSamples;
    startTime(6, i) = locInSamples(11) / audioLenInSamples;
    startTime(7, i) = locInSamples(13) / audioLenInSamples;

    
    
    occupyArea(1, i) = annotation(2) * fs / audioLenInSamples;
    occupyArea(2, i) = annotation(4) * fs / audioLenInSamples;
    occupyArea(3, i) = annotation(6) * fs / audioLenInSamples;
    occupyArea(4, i) = annotation(8) * fs / audioLenInSamples;
    occupyArea(5, i) = annotation(10) * fs / audioLenInSamples;
    occupyArea(6, i) = annotation(12) * fs / audioLenInSamples;
    occupyArea(7, i) = annotation(14) * fs / audioLenInSamples;
    
    
end


end
toc;
fprintf('======================================\n');

fprintf('Part1 starting position mean = %g\n', mean(startTime(1,:)));
fprintf('      starting position std  = %g\n', std(startTime(1,:)));
fprintf('Part2 starting position mean = %g\n', mean(startTime(2,:)));
fprintf('      starting position std  = %g\n', std(startTime(2,:)));
fprintf('Part3 starting position mean = %g\n', mean(startTime(3,:)));
fprintf('      starting position std  = %g\n', std(startTime(3,:)));
fprintf('Part4 starting position mean = %g\n', mean(startTime(4,:)));
fprintf('      starting position std  = %g\n', std(startTime(4,:)));
fprintf('Part5 starting position mean = %g\n', mean(startTime(5,:)));
fprintf('      starting position std  = %g\n', std(startTime(5,:)));
fprintf('Part6 starting position mean = %g\n', mean(startTime(6,:)));
fprintf('      starting position std  = %g\n', std(startTime(6,:)));
fprintf('Part7 starting position mean = %g\n', mean(startTime(7,:)));
fprintf('      starting position std  = %g\n', std(startTime(7,:)));

fprintf('======================================\n');

fprintf('Part1 occupied area mean = %g\n', mean(occupyArea(1,:)));
fprintf('      occupied area std  = %g\n', std(occupyArea(1,:)));
fprintf('Part2 occupied area mean = %g\n', mean(occupyArea(2,:)));
fprintf('      occupied area std  = %g\n', std(occupyArea(2,:)));
fprintf('Part3 occupied area mean = %g\n', mean(occupyArea(3,:)));
fprintf('      occupied area std  = %g\n', std(occupyArea(3,:)));
fprintf('Part4 occupied area mean = %g\n', mean(occupyArea(4,:)));
fprintf('      occupied area std  = %g\n', std(occupyArea(4,:)));
fprintf('Part5 occupied area mean = %g\n', mean(occupyArea(5,:)));
fprintf('      occupied area std  = %g\n', std(occupyArea(5,:)));
fprintf('Part6 occupied area mean = %g\n', mean(occupyArea(6,:)));
fprintf('      occupied area std  = %g\n', std(occupyArea(6,:)));
fprintf('Part7 occupied area mean = %g\n', mean(occupyArea(7,:)));
fprintf('      occupied area std  = %g\n', std(occupyArea(7,:)));



clearvars -except startTime occupyArea
save statisticFBA.mat

