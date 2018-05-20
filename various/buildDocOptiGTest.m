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

%% Build documentation (using m2html library)
% L. LAURENT -- 20/05/2018 -- luc.laurent@lecnam.net

%add path m2html
addpath('various/m2html');

%load paths
dirPath={'@optiGTest','Constrained','MultiObj','unConstrained','various'};

%% Build documentation

%add configuration to bash (for finding 'dot' script of graphviz)
setenv('BASH_ENV','~/.bash_profile');

%directory to be analysed
analyseDir='optiGTest';
%ignoring directory
%ignDir={'};

%list of files
listFiles=listFilesoptiGTest(dirPath);
%add path to all files
listFiles=cellfun(@(x) sprintf('%s/%s',analyseDir,x),listFiles,'UniformOutput',false);

cd ..
warning('off')
%execute generation of the doc (Graphviz is optional)
m2html('mfiles',listFiles,...
    'htmldir',[analyseDir '/various/doc'],...
    'recursive','on',...
    'global','on',...
    'globalHypertextLinks','on',...
    'index','menu',...
    'template','frame',...
    'index','menu',...
    'download','off',...
    'graph','on')
warning('on')
cd(analyseDir)
%%%%%%
