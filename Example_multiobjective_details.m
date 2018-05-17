%% Multi-objective example (optiGTest class)
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

%% load the function
Fun=optiGTest('Poloni');

%% Demo mode
Fun.demo

%% available dimensions (Inf= function defined for any dimension)
Fun.dimAvailable


%% evaluation of the function (responses and gradients)
nS=10^4;
samples=rand(nS,2);
X=repmat((Fun.xMax-Fun.xMin),nS,1).*samples+repmat(Fun.xMin,nS,1);
% Z=responses, GZ=gradients (in cell) GZr=gradients (in array)
[Z,GZ,GZr]=Fun.evalObj(X);
Z 
GZ
GZr

%% show Pareto
Fun.showPareto;

