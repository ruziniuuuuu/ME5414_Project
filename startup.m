clc;clear;

pathFile = './matlabPaths.txt';
fileID = fopen(pathFile, 'r');
paths = textscan(fileID, '%s', 'Delimiter', '\n');
fclose(fileID);

for i = 1:numel(paths{1})
    addpath(paths{1}{i});
end