%% Booth's function
%L. LAURENT -- 16/09/2011 -- luc.laurent@lecnam.net

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
%global minimum: f(x1,x2)=0 pour (x1,x2)=(1,3)
%
%Design space: -10<x1<10, -10<x<10



function [p,dp]=funBooth(xx)

%responses and derivatives
xxx=xx(:,:,1);
yyy=xx(:,:,2);

p = (xxx+2*yyy-7).^2+(2*xxx+yyy-5).^2;

if nargout==2
    dp(:,:,1)=2*(xxx+2*yyy-7)+4*(2*xxx+yyy-5);
    dp(:,:,2)=4*(xxx+2*yyy-7)+2*(2*xxx+yyy-5);
end
end