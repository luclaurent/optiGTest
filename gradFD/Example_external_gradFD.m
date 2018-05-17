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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% external use of the class
fprintf('external use of the class\n');

%load the class without specified the function
gradExtA=gradFD('FD1',[0 1;2 3],1e-3);

%extract the values of the requested points
pointGradExtA=gradExtA.XevalG;

%external evaluations of the function
ZA=funA(pointGradExtA);

%load the responses values
gradExtA.loadZextG(ZA);

%extract derivatives
gradExtA.GZeval