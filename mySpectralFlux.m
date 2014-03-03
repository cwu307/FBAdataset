%% Spectral flux
% Chih-Wei Wu, 2013/09, GTCMT
% objective: extract spectral flux per block
% input: x = signal x
%        windowSize = your block size
%        hopSize = your hop size
% output: vsf = spectral flux     0 <= vsf <= A

function [vsf] = mySpectralFlux(x, windowSize, hopSize)


%STFT
noverlap = windowSize - hopSize;
X = spectrogram(x, windowSize, noverlap);
[m, n] = size(X);

for i = 1:n
    if (i-1) > 1
        vsf(i) = (sum((abs(X(:,i)) - abs(X(:,i-1))).^2))^(0.5)/(windowSize/2);
    else
        vsf(i) = (sum((abs(X(:,i))).^2))^(0.5)/(windowSize/2);
    end
end


