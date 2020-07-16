%% Test Tube Holder function
% L. LAURENT -- 22/02/2017 -- luc.laurent@lecnam.net

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

%1 minimum global: f(pi/2,0)=-10.872299901558
%
%Design space -10<xi<10


function [p,dp] = funTubeHolder(xx)

%constants
a=4;
b=1/200;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
%
pa=b*x.^2+b*y.^2;
ca=cos(pa);
sx=sin(x);
cy=cos(y);
%
g=exp(abs(ca)).*sx.*cy;
p=-a*abs(g);

if nargout==2
    %
    cx=cos(x);
    sy=sin(y);
    dk(:,:,1)=cx.*cy;
    dk(:,:,2)=-sx.*sy;
    %
    sa=sin(pa);
    dh=-2*b*xx.*sa.*sign(ca);
    %
    dg=dh.*g+exp(abs(ca)).*dk;
    %
    dp=-a*dg.*sign(g);
end
end
