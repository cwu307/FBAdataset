%% Block-wise absolute max amplitude
% Chih-Wei Wu, 2013/09, GTCMT
% objective: extract absolute maximum amplitude(envelope)
% input: x = signal x
%        windowSize = your block size
%        hopSize = your hop size
% output: vMaxAmp = maximum absolute amplitude of each block


function [vMaxAmp] = myMaxAmp(sig, windowSize, hopSize)

xmat = x2mat(sig, windowSize, hopSize); %signal to matrix function

[~, n3] = size(xmat);
for i = 1:n3
    [vMaxAmp(i), ~] = max(abs(xmat(:, i)));
end
