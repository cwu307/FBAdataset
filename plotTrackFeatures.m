%% plot the data
% objective : plot every feature with grdTruth     
%
% Chih-Wei Wu, GTCMT, 2014/03

clear all; clc; close all;
load subsetFBA.mat



%select the track to plot
trackId = 2;

%read data from the dataset
data       = subsetFBA{trackId}{1};
annotation = subsetFBA{trackId}{2};

%define parameters
windowSize = 1024;
hopSize    = 1/4 * windowSize;
fs         = 44100;

[locInSamples, locInFrames] = annToLoc(annotation, windowSize, hopSize, fs);

%plot the results
subplot(511)
addVerticalLines(data(1, :), locInFrames);
title('Spectral Centroid');
subplot(512)
addVerticalLines(data(2, :), locInFrames);
title('Maximum Amplitude');
subplot(513)
addVerticalLines(data(3, :), locInFrames);
title('Zero Crossing Rate');
subplot(514)
addVerticalLines(data(4, :), locInFrames);
title('Spectral Crest');
subplot(515)
addVerticalLines(data(5, :), locInFrames);
title('Spectral Flux');