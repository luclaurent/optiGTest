%% Function for displaying available multi-objective problems
% L. LAURENT --  04/05/2018 -- luc.laurent@lecnam.net

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

function dispAvailablePb(txt)

if nargin==0
    txt='';
end
flagUn=false;
flagCons=false;
flagMulti=false;
switch txt
    case {'cons','Cons','constrained','Constrained','constraint','Constraint'}
        flagCons=true;
    case {'uncons','unCons','unconstrained','unConstrained'}
        flagUn=true;
    case {'multi','Multi','multiObjective','multiobjective'}
        flagUn=true;
    otherwise
        flagUn=true;
        flagCons=true;
        flagMulti=true;
end

%extract name of porblems
strPbUn=loadDimUn();
strPbCons=loadProbCons();
strPbMulti=loadProbMulti();
%
listPbUn=fieldnames(strPbUn);
listPbCons=fieldnames(strPbCons);
listPbMulti=fieldnames(strPbMulti);
%count information
funCount=@(x,y,n)numel(x(n).(y));
nbConsPb=cellfun(@(x)funCount(strPbCons,x,3),listPbCons);
nbMultiConsPb=cellfun(@(x)funCount(strPbMulti,x,3),listPbMulti);
nbMultiObjPb=cellfun(@(x)funCount(strPbMulti,x,1),listPbMulti);
%
%Show existing problems
fprintf('=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=\n');
fprintf('Available test problems\n');
if flagUn
    fprintf('------------------------\n');
    cellfun(@(X)fprintf('Unconstrained: %s\n',X),listPbUn);
    fprintf('------------------------\n');
end
if flagCons
    fprintf('------------------------\n');
    cellfun(@(X,Y,Z)fprintf('Constrained: %s (nb constraints: %i)\n',X,Y),...
        listPbCons,num2cell(nbConsPb));
    fprintf('------------------------\n');
end
if flagMulti
    fprintf('------------------------\n');
    cellfun(@(X,Y,Z)fprintf('Multiobjective: %s (nb objective/constraints: %i/%i)\n',X,Y,Z),...
        listPbMulti,num2cell(nbMultiObjPb),num2cell(nbMultiConsPb));
    fprintf('------------------------\n');
end
fprintf('=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=\n');
end