%% Read path
% objective : set the folder and read the list
% output: dataDir = dir path of data
%         annDir = dir path of annotation

% set the directory of data
function [dataDir, annDir] = readPath


% dataList = {
% '/Users/mac/Desktop/Database/ENST-drums-public/drummer_1/audio/dry_mix';
% '/Users/mac/Desktop/Database/ENST-drums-public/drummer_2/audio/dry_mix';
% '/Users/mac/Desktop/Database/ENST-drums-public/drummer_3/audio/dry_mix';
% 
%     };
% 
% annList = {
% '/Users/mac/Desktop/Database/ENST-drums-public/drummer_1/annotation';
% '/Users/mac/Desktop/Database/ENST-drums-public/drummer_2/annotation';
% '/Users/mac/Desktop/Database/ENST-drums-public/drummer_3/annotation';
%     };



dataList = {
'/Users/mac/Desktop/Database/ODB/audio';
    };

annList = {
'/Users/mac/Desktop/Database/ODB/ground truth';
    };
% 
% 
% dataList = {
% '/Users/mac/Desktop/Database/Leveau/sounds';
%     };
% 
% annList = {
% '/Users/mac/Desktop/Database/Leveau/goodlabels';
%     };


dataDir = dataList;
annDir = annList;