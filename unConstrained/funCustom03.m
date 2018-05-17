%% Custom function 3
%L. LAURENT -- 14/12/2017 -- luc.laurent@lecnam.net

% sources available here:
% https://bitbucket.org/luclaurent/optigtest/
% https://github.com/luclaurent/optigtest/

% optiGTest - set of testing functions    A toolbox to easy manipulate functions.
% Copyright (C) 2017  Luc LAURENT <luc.laurent@lecnam.net>
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

%
%global minimum : f(x)=-1 for x={pi;3*pi;5*pi;7*pi;11*pi;13*pi;15*pi;17*pi}
%
%Design space: -1<xi<15
%


function [p,dp]=funCustom03(xx)
%constants
a=4;

%evaluation and derivatives
%
p=cos(a*xx);

%
if nargout==2
    %
    dp=-a*sin(a*xx);
end
%
end