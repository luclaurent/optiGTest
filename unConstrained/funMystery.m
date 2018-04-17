%% "Mystery" function (Sasena 2002)
%L. LAURENT -- 01/04/2011 -- luc.laurent@lecnam.net

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
%3 local minima
%1 global minimum: f(x)=-1.4565 pour x={2.5044,2.5778}
%
%design space: 0<xi<5

function [p,dp]=funMystery(xx)

a=2;
b=0.01;
c=2;
d=2;
e=7;
f=0.5;
g=0.7;

%responses and derivatives
xxx=xx(:,:,1);
yyy=xx(:,:,2);

myst=a+b*(yyy-xxx.^2).^2+(1-xxx).^2+c*(d-yyy).^2+e*sin(f*xxx).*sin(g*xxx.*yyy);
p=myst;
if nargout==2
    dmyst(:,:,1)=-b*4*(yyy-xxx.^2)-2*(1-xxx)+...
        e*f*cos(f*xxx).*sin(g*xxx.*yyy)+e*g*yyy.*sin(f*xxx).*cos(g*xxx.*yyy);
    dmyst(:,:,2)=2*b*(yyy-xxx.^2)-4*(d-yyy)+e*g*xxx.*sin(f*xxx).*cos(g*xxx.*yyy);
    dp=dmyst;
end
end