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

%% check function by checking minimum and gradients
% INPUTS:
%  - pbName: name of the problems [optional]
%  - statusPause: allow to pause the process [optional]
% OUTPUT:
%  - isOk: status of the checking

function isOk=checkPb(obj,pbName,statusPause)
if nargin==1; pbName=obj.namePb;end
if nargin<3; statusPause=false;end
%check minimum
obj.namePb=pbName;
%check minimum on objective function
isOk=obj.checkFunObj;
%check gradients
% of objective function(s)
for itF=1:obj.nbObj
    funCheck=@(X)obj.evalObj(X,itF);
    isOkCurrent=obj.checkGradFun(funCheck,obj.funObj{itF});
    isOk=isOk&&isOkCurrent;
end
% of constraint function(s)
if obj.nbCons>0
    for itF=1:obj.nbCons
        funCheck=@(X)obj.evalCons(X,itF);
        isOkCurrent=obj.checkGradFun(funCheck,obj.funCons{itF});
        isOk=isOk&&isOkCurrent;
    end
end
if ~isOk&&statusPause
    pause
end
end