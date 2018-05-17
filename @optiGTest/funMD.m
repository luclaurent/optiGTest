%% Method of optiGTest class
% L. LAURENT --  15/04/2018 -- luc.laurent@lecnam.net

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

%% build table of all function in Markdown
% INPUT:
%  - nbCol: number of columns in the requested table
% OUTPUTS:
%  - isOk: status flag of the function

function isOk=funMD(obj,nbCol,type)
if nargin==1;nbCol=3;end
isOk=true;
if nargin<3;type='';end

%extract name of functions
switch type
    case {'cons','Cons'}
        strFun=loadDimCons();
        strPb=loadProbCons();
    case {'multi','Multi'}
        strFun=loadDimMulti();
        strPb=loadProbMulti();
    otherwise
        strFun=loadDimUn();
end
listFun=fieldnames(strFun);
listDim=cell(1,numel(listFun));
nbCons=zeros(1,numel(listFun));
nbObj=zeros(1,numel(listFun));
for itF=1:numel(listFun)
    listDim{itF}=strFun.(listFun{itF});
end
switch type
    case {'cons','Cons','multi','Multi'}
        for itF=1:numel(listFun)
            nbObj(itF)=numel(strPb(1).(listFun{itF}));
            nbCons(itF)=numel(strPb(2).(listFun{itF}));
        end
end

%generate Markdown table
buildTableMD(listFun,listDim,nbCol,nbObj,nbCons);
end