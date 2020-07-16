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

%% evaluate all functions
% INPUTS:
%  - XX: sample points on which the constraint function(s) will be evaluate [optional]
% OUTPUTS:
%  - ZZ, GZ: responses and gradients of the objective function(s) stored in cells (in the case of one objective function no cell is used)
%  - GG, GGG: responses and gradients of the objective function(s) stored in cells (in the case of one contraint function no cell is used)

function [ZZ,GZ,GG,GGG]=evalAll(obj,XX)
if nargin>1
    obj.prepX(XX);
end
% evaluate objective function(s)
[ZZ,GZ]=obj.evalObj;
% evaluate constraint function(s)
if nargout>2
    [GG,GGG]=obj.evalCons;
end
end