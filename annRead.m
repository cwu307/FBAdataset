%% Annotation read
% objective : get onset annotation from input txt file 
% input : filename 
%         flag = read .mat or not?
% output: annotation

function [annotation] = annRead(annName, flag)
if flag == 0

    %read the onset time and drum type
    [time, drum] = textread(annName,'%s%s','headerlines',0);

    N = length(time);
    annotation = zeros(N, 1);
    for i = 1:N
        annotation(i,1) = str2num(time{i});
    end

elseif flag == 1
    
    load(annName);
    annotation = labels_time';
       
end
