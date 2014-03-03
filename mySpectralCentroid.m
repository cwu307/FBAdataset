%% 6201 Computational Music Analysis
% Chih-Wei Wu, 2013/09, GTCMT
% mySpectralCentroid.m
% objective: extract the spectral centroid feature
% input, x : input signal
%        windowSize 
%        hopSize
% output, spectCent : spectral centroid for each block

function [vsc] = mySpectralCentroid(x, fs, windowSize, hopSize)

%STFT
noverlap = windowSize - hopSize;
X = spectrogram(x, windowSize, noverlap);
[m, n] = size(X);
j = (1:m)*fs/windowSize; %freq index in Hz

%centroid
vsc = zeros(1, n);
for i = 1:n
    tmp = sum(abs(X(:, i)).^2); 
    if tmp == 0
        vsc(i) = 0;
    else
        vsc(i) = sum(j'.*abs(X(:, i)).^2)/tmp;
    end
    
end
