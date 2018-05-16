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

%% display details about the defined problem

function dispDetails(obj)
if ~isempty(obj.namePb)
    fprintf('\n## Problem: %s\n',obj.namePb);
    fprintf('# Objective function(s):');
    %
    funDisp=@(x)fprintf(' %s,',x);
    %
    if obj.nbObj>1
        cellfun(funDisp,obj.funObj);
    else
        fprintf(' %s',obj.funObj{1});
    end
    fprintf('\n');
    %
    fprintf('# Constraint function(s):');
    if obj.nbCons==0
        fprintf(' None');
    else
        cellfun(funDisp,obj.funCons);
    end
    fprintf('\n');
    %
    fprintf('# Considered dimension: %i\n',obj.dim);
    fprintf('# Considered design space:\n');
    fprintf('#  Min: ');fprintf('%-+d\t',obj.xMin);fprintf('\n');
    fprintf('#  Max: ');fprintf('%-+d\t',obj.xMax);fprintf('\n');
    fprintf('# Considered global minimum(s) (sample points and response value(s)):\n');
    %
    Xmin=obj.globMinX;
    Zmin=obj.globMinZ;
    for itM=1:numel(Zmin)
        fprintf('# ');
        fprintf('%-+d\t',Xmin(itM,:));
        fprintf('|| %d \n',Zmin(itM));
    end
    fprintf('\n');
end
end