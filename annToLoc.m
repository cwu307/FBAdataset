%% Annotation to location index
% objective: transform my annotation from SonicVisualizer to location index     
% input:  annotation   = n * 1 (vector)
%         windowSize   = (int)
%         hopSize      = (int)  
%         fs           = sampling frequency (Hz)
% output: locInSamples = n * 1 (vector)
%         locInFrames  = n'* 1 (vector)
% Chih-Wei Wu, GTCMT, 2014/03


function [locInSamples, locInFrames] = annToLoc(annotation, windowSize, hopSize, fs)

% note:
% the data in the annotation file always goes like this:
% starting time
% duration 
% starting time
% duration...
[L, ~]   = size(annotation);
locInSamples = zeros(L, 1); 
locInFrames = zeros(L, 1); 

for i = 1:L
    
    mark = mod(i, 2);
    
    if (mark == 1)
        
        locInSamples(i) = round(annotation(i) * fs);
        locInFrames(i)  = round(annotation(i) * fs / hopSize);
        
    elseif (mark == 0)
        
        locInSamples(i) = round(annotation(i - 1) * fs + annotation(i) * fs);
        locInFrames(i)  = round((annotation(i - 1) * fs + annotation(i) * fs)/hopSize);
    end
    
end

    
    
