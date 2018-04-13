%% CrossLegTable function 
%L. LAURENT -- 14/03/2017 -- luc.laurent@lecnam.net

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
%global minimum : f(x)=-1 for x1=0 (forall x2) or x2=0 (forall x1)
%
%Design space: -10<xi<10


function [p,dp]=funCrossLegTable(xx)
%constants
a=0.1;
b=100;
c=pi;
d=1;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
%
xy=sqrt(x.^2+y.^2);
fxy=b-xy./c;
%
pa=exp(abs(fxy));
sx=sin(x);
sy=sin(y);
%
h=pa.*sx.*sy;
g=abs(h)+d;
%
p=-1./g.^a;
%
if nargout==2
    %
    dh=cos(xx).*sin(xx(:,:,[2 1])).*pa-1/c*xx./xy.*sign(fxy).*h;
    %
    dg=sign(h).*dh;
    %
    dp=a*dg./g.^(a+1);
end
end
