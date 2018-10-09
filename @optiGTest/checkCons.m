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

%% check constraints status (violation of constraints)
% INPUTS:
%  - XX: sample points [optional]
%  - num: number of the checked constraint function(s) [optional]
%  - ZZ: provided values of the constraint(s) [optional]
% OUTPUT:
%  - status: status of the constraints violation stored in cells (in the case of one constraint no cell is used)

function status=checkCons(obj,XX,num,ZZ)
%default values
numOk=[];
status=true;
if obj.nbCons>0
    availResp=false;availPts=false;
    %deal with input arguments
    if nargin==4, if ~isempty(ZZ);availResp=true;ZZOk=ZZ;end, end
    if nargin>1, if ~isempty(XX);availPts=true;end, end
    if nargin>2, if ~isempty(num);numOk=num;end, end
    %available sample points
    if availPts
        obj.prepX(XX);
        availResp=false; % priority on new sample points
    end
    % with no values of constraints
    if ~availResp
        %evaluation contraint(s)
        ZZOk=obj.evalCons([],numOk);
    end
    
    %% check constraints
    %specific constraint test
    if ~isempty(numOk)
        cellType=obj.typeCons(numOk);
    else
        cellType=obj.typeCons;
    end
    %obtain right function name
    testFun=cellfun(@(x)boolFun(x),cellType,'UniformOutput',false);
    %many constraints
    funCheck=@(x,y)y(x,0);
    if iscell(ZZOk)
        status=cellfun(funCheck,ZZOk,testFun,'UniformOutput',false);
    else
        status=feval(funCheck,ZZOk,testFun{1});
    end
else
    Ofprintf('No constraint function(s)\n');
end
end