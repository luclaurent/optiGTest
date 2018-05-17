%% Bohachevsky2 function
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
%global minimum: f(x1,x2)=0 pour (x1,x2)=(0,0)
%
%Design space: -100<x1<100, -100<x2<100



function [p,dp]=funBohachevsky2(xx)

%responses and derivatives
xxx=xx(:,:,1);
yyy=xx(:,:,2);

p = xxx.^2+2*yyy.^2-0.3*cos(3*pi*xxx).*cos(4*pi*yyy)+0.3;

if nargout==2
    dp(:,:,1)=2*xxx+0.9*pi*sin(3*pi*xxx).*cos(4*pi*yyy);
    dp(:,:,2)=4*yyy+1.2*pi*cos(3*pi*xxx).*sin(4*pi*yyy);
end
end