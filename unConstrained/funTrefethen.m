%% Trefethen function
% L. LAURENT -- 23/02/2017 -- luc.laurent@lecnam.net

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

%1 minimum global: f(-0.02440307923,0.2106124261)=-3.3068686474
%
%Design space -5<xi<5


function [p,dp] = funTrefethen(xx)

%constants
a=0.25;
b=0.25;
c=50;
d=10;
e=60;
f=70;
g=80;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
%
sx=sin(c*x);
sa=sin(d*x+d*y);
sb=sin(e*exp(y));
sc=sin(f*sin(x));
sd=sin(sin(g*y));
%
p=a*x.^2+b*y.^2+exp(sx)-sa ...
    +sb+sc+sd;

if nargout==2
    %
    dp=zeros(size(xx));
    %
    ca=cos(d*x+d*y);
    %
    dp(:,:,1)=2*a*x+c*cos(c*x).*exp(sx) ...
        -d*ca+f*cos(x).*cos(f*sin(x));
    dp(:,:,2)=2*b*y-d*ca ...
        +e*exp(y).*cos(e*exp(y)) ...
        +g*cos(g*y).*cos(sin(g*y));
end
end
