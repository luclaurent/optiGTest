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

%% check objective function(s) using minimum
% OUTPUT:
%  - isOk: status of the checking

function isOk=checkFunObj(obj)
isOk=true;
%load dimension
dimCheck=obj.getDimAvailable;
%
if isinf(dimCheck);dimCheck=5;end
if numel(dimCheck)~=1;[~,II]=min(abs(dimCheck-5));dimCheck=dimCheck(II);end
obj.dim=dimCheck;
%details of minimum
X=obj.globMinX;
Z=obj.globMinZ;
%threshold
limO=1e-4;
% works only for non multiobjective problems
if ~any(isnan(Z))
    if size(X,2)>obj.dim
        X=X(:,1:obj.dim);
    end
    %compute objective value
    ZZ=obj.evalObj(X);
    %
    if all(abs(ZZ(:)-Z(:))>limO)
        fprintf('Issue with the %s function (wrong minimum obtained)\n',obj.namePb);
        fprintf('Obtained: ');fprintf('%d ',ZZ(:)');
        fprintf('\n');
        fprintf('Expected: ');fprintf('%d ',Z(:)');
        fprintf('\n');
        isOk=false;
    end
end
end