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

%% check all problems
% INPUTS:
%  - varargin [optional]:
%     - boolean: if true, continue to check problems from the previous one, is false, start at the beginning
%     - string: type of problem (unconstrained, constrained, multiobjective)
% OUTPUT:
%  - status: status of the constraints violation stored in cells (in the case of one constraint no cell is used)

function isOk=checkAllPb(obj,varargin)
%default values
isOk=true;
flag=false;
typeCheckPb='';
%deal with input arguments
for itV=1:numel(varargin)
    if  islogical(varargin{itV})
        flag=varargin{itV};
    elseif ischar(varargin{itV})
        typeCheckPb=varargin{itV};
    end
end

%extract list of problems
listFun=listPb(typeCheckPb);
if flag %check all by continuing at the current position
    currPos=find(ismember(listFun,obj.consPb));
    currPos=currPos(1);
    listFun=listFun(currPos:end);
end
%check every function
for itF=1:numel(listFun)
    Ofprintf(' >>> Problem %s\n',listFun{itF});
    tmpStatus=obj.checkPb(listFun{itF},true);
    isOk=isOk&&tmpStatus;
end
end