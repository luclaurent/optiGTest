%% Parsopoulos function
%L. LAURENT -- 17/11/2016 -- luc.laurent@lecnam.net

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
%global minimum : f(x)=0 for x=(pi/2,pi)
%
%Design space: -5<xi<5


function [p,dp]=funParsopoulos(xx)

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
cx=cos(xxx);
sy=sin(yyy);
p=cx.^2+sy.^2;

if nargout==2
    dp(:,:,1)=-2*cos(xxx).*sin(xxx);
    dp(:,:,2)=2*cos(yyy).*sin(yyy);
end
end
