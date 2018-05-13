%% add functions in matlab's path
function addTree(obj)
%extract folder of the current class
folder=fileparts(mfilename('fullpath'));
%add specific folder in matlab's path
if iscell(obj.nameDir)
    fullDir=cellfun(@(x)fullfile(folder,x),obj.nameDir,'UniformOutput',false);
    cellfun(@addpath,fullDir);
else
    addpath(fullfile(folder,obj.nameDir));
end
%addpath gradFD
addpath(fullfile(folder,'gradFD'));
end