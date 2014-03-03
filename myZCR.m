%% Zero Crossing Rate
% Chih-Wei Wu, 2013/09, GTCMT
% objective: extract zero crossing rate per block
% input: x = signal x
%        windowSize = your block size
%        hopSize = your hop size
% output: vzc =  the percentage of zero crossing within one block
%                0 < vzc <= 1;

function [vzc] = myZCR(x, windowSize, hopSize)

xmat = x2mat(x, windowSize, hopSize);
[m, n] = size(xmat);

for i = 1:n
    if i - 1 > 1
        vzc(i) = 1/(2*windowSize)*sum(abs(sign(xmat(:,i)) - sign(xmat(:,i-1))));
    else
        vzc(i) = 1/(2*windowSize)*sum(abs(sign(xmat(:,i)))); %xmat(-1) = 0
    end
end
