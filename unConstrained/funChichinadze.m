%% Chichinadze's function
%L. LAURENT -- 04/11/2016 -- luc.laurent@lecnam.net

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
%1 global minimum
%f(x1,x2)=-42.94438701899098  for (x1,x2)=(6.189866586965680,0.5)
%
%Design space: -500<x1,x2<500




function [p,dp]=funChichinadze(xx)

%constants
a=12;
b=11;
c=10;
d=pi/2;
e=8;
f=5*d;
g=0.2*sqrt(5);
h=1/2;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluations and derivatives
pa=xxx.^2-a*xxx+b;
pb=c*cos(d*xxx)+e*sin(f*xxx);
pc=exp(-h*(yyy-h).^2);
%
p=pa+pb+g*pc;

if nargout==2
    dp(:,:,1)=2*xxx-a...
        -c*d*sin(d*xxx)+e*f*cos(f*xxx);
    dp(:,:,2)=-2*h*g*yyy.*pc;
end
end