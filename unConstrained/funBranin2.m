%% Branin's function 2
%L. LAURENT -- 13/12/2010 -- luc.laurent@lecnam.net

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
%3 global minima :
%f(x1,x2)=5.559037 for (x1,x2)=(-3.2,12.53)
%
%Design space: -5<x1,x2<15



function [p,dp]=funBranin2(xx)

%constants
a=5.1/(4*pi^2);
b=5/pi;
c=6;
d=10;
e=1/(8*pi);

%responses and derivatives
xxx=xx(:,:,1);
yyy=xx(:,:,2);

p = (yyy-a*xxx.^2+b*xxx-c).^2 ...
    +d*(1-e)*cos(xxx).*cos(yyy)+log(xxx.^2+yyy.^2+1)+d;

if nargout==2
    dp(:,:,1)=2*(yyy-a*xxx.^2+b*xxx-c).*(b-2*a*xxx)...
        -d*(1-e)*sin(xxx).*cos(yyy)...
        +2*xxx./(xxx.^2+yyy.^2+1);
    dp(:,:,2)=2*(yyy-a*xxx.^2+b*xxx-c)...
        -d*(1-e)*cos(xxx).*sin(yyy)...
        +2*yyy./(xxx.^2+yyy.^2+1);
end
end