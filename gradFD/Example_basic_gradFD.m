%% Basic example of the use of the class gradFD
% L. LAURENT --  13/04/2018 -- luc.laurent@lecnam.net

% sources could be found here:
% https://bitbucket.com/luclaurent/gradFD
% https://github.com/luclaurent/gradFD
%

% gradFD - A toolbox to compute derivatives and hessians using finite differences
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% variables created for this example

%specific function (peaks's Matlab function)
funA=@(x)peaks(x(:,1),x(:,2));

%1D function
funB=@(x) exp(-x/10).*cos(x)+1/10*x;
funDB=@(x) -exp(-x/10).*(sin(x)+1/10.*cos(x))+1/10;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% classical use of the class
fprintf('Classical use of the class\n');

%load the class with all options
gradA=gradFD('FD1',[0 1;2 3],1e-3,funA);

%extract derivatives
gradA.GZeval

%compute derivatives at other points
gradA.Xref=[4 5;6 9; 4 5];

%extract derivatives
gradA.GZeval

%change stepsizes (one per points)
gradA.stepsDiff=[1e-2;1e-3;1e-4];

%extract derivatives
gradA.GZeval

%change stepsizes (one per direction)
gradA.stepsDiff=[1e-2 1e-3];

%extract derivatives
gradA.GZeval

