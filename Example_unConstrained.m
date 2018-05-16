%% unConstrained example (optiGTest class)
% L. LAURENT --  28/04/2017 -- luc.laurent@lecnam.net

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
Fun=optiGTest('Levy03');

%% Demo mode
Fun.demo

%% available dimensions (Inf= function defined for any dimension)
Fun.dimAvailable

%% Change dimension 
Fun.dim=3;

%% evaluation of the objective function (responses and gradients)
X=[0 1 2;
    3 4 5;
    6 7 8];
% Z=responses, GZ=gradients (in cell) GZr=gradients (in array)
[Z,GZ,GZr]=Fun.evalObj(X);
Z 
GZ
GZr

%% check the function
Fun.checkPb

%% Global minimum 
Fun.globMinX
Fun.globMinZ

%% list available problems
dispAvailablePb 