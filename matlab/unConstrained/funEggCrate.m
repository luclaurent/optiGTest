%% Egg Crate's function
%L. LAURENT -- 15/11/2016 -- luc.laurent@lecnam.net

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
%global minimum : f(x1,x2)=0 for (0,0)
%
%Design space: -5<xi<5


function [p,dp]=funEggCrate(xx)

%constants
a=25;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
sx=sin(xxx);
sy=sin(yyy);
p=xxx.^2+yyy.^2+a*(sx.^2+sy.^2);
%
if nargout==2
    cx=cos(xxx);
    cy=cos(yyy);
    %
    dp(:,:,1)=2*xxx+2*a*cx.*sx;
    dp(:,:,2)=2*yyy+2*a*cy.*sy;
end
end