%% Spectral Crest Factor
% Chih-Wei Wu, 2013/09, GTCMT
% objective: extract spectral crest for each block
% input: x = signal x
%        windowSize = your block size
%        hopSize = your hop size
% output: vtsc = spectral crest factor   2/windowSize <= vtsc <= 1

function [vtsc] = mySpectralCrest(x, windowSize, hopSize)
%STFT
noverlap = windowSize - hopSize;
X = spectrogram(x, windowSize, noverlap);
[m, n] = size(X);

%Spectral Crest
for i = 1:n   
    tmp = sum(abs(X(:,i))); 
    if tmp == 0
        vtsc(i) = 0;
    else
        vtsc(i) = max(abs(X(:,i)))/tmp;
    end
end
