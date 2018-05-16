%% Quadratic function
%L. LAURENT -- 19/11/2016 -- luc.laurent@lecnam.net

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
%global minimum : f(x)=-3873.7243 for x=(0.19388,0.48513)
%
%Design space: -10<xi<10


function [p,dp]=funQuadratic(xx)

%constants
a=-3803.84;
b=-138.08;
c=-232.92;
d=128.08;
e=203.64;
f=182.25;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
p=a+b*xxx+c*yyy+d*xxx.^2+e*yyy.^2+f*xxx.*yyy;

if nargout==2
    dp(:,:,1)=b+2*d*xxx+f*yyy;
    dp(:,:,2)=c+2*e*yyy+f*xxx;
end
end
