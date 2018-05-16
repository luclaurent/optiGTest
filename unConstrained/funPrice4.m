%% Price 4 function
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
%global minimum : f(x)=0 for x={(0,0),(2,4),(1.464,?2.506)}
%
%Design space: -500<xi<500


function [p,dp]=funPrice4(xx)

%constants
a=2;
b=6;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
g=a*xxx.^3.*yyy-yyy.^3;
h=b*xxx-yyy.^2+yyy;
%
p=g.^2+h.^2;

if nargout==2
    dp(:,:,1)=6*a*xxx.^2.*yyy.*g+2*b*h;
    dp(:,:,2)=2*(a*xxx.^3-3*yyy.^2).*g+(1-2*yyy).*h;
end
end
