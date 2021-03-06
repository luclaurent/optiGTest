%% optiGTest toolbox
% L. LAURENT --  16/05/2018 -- luc.laurent@lecnam.net

% sources available here:
% https://bitbucket.org/luclaurent/optigtest/
% https://github.com/luclaurent/optigtest/

% optiGTest - set of testing functions    A toolbox to easy manipulate functions.
% Copyright (C) 2018  Luc LAURENT <luc.laurent@lecnam.net>
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.
%     

%% List all files of the optiGTest Toolbox
% L. LAURENT -- 20/05/2018 -- luc.laurent@lecnam.net


% To be executed at the root position of the toolbox


function listF=listFilesoptiGTest(dirT)
listF={};
%process all directories in the directory 'dirT'
for ii=1:numel(dirT)
    %find files in directories
    fileDir=listFileDir(dirT{ii});
    %add name of the directory
    fun=@(x) sprintf('%s/%s',dirT{ii},x);
    fileDirOk=cellfun(fun,fileDir,'UniformOutput',false);
    %add to the whole list
    listF={listF{:},fileDirOk{:}};
end
%add the root directory of the Toolbox
fileDirOk=listFileDir('.');
%add to the whole list
listF={listF{:},fileDirOk{:}};


%Files to avoid
blacklist={'.git',char(126),'m2html','.DS_Store',...
    'wiki','Figures','unConstrainedWiki.txt','docs','.nb'};

for jj=1:numel(blacklist)
    %pattern to check
    checkF=blacklist{jj};
    %seek the pattern
    kk=strfind(listF,checkF);
    if ~isempty(kk)
        %missing pattern
        hh=cellfun(@isempty,kk);
        %remove from the list
        IX=find(hh);
        listF={listF{IX}};
    end
end
%manually addition
%listF{end+1}='src/libs/PSOt/pso_Trelea_mod.m';
end


% list files in a directory 
function [filDir]=listFileDir(dirM)
%rawlist
rawList=dir(dirM);
%flag file
flag_file=~[rawList.isdir];
%list of files in the directory
filDir={rawList(flag_file).name};
end