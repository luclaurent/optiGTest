%% Cross-in-Tray function
%L. LAURENT -- 05/11/2016 -- luc.laurent@lecnam.net

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
%4 global minimas : f(x1,x2,x3,x4)=-2.06261218 for 
% {(1.349406685353340,1.349406608602084),
%   (-1.349406685353340,1.349406608602084),
%   (1.349406685353340,-1.349406608602084),
%   (-1.349406685353340,-1.349406608602084)}
%
%Design space: -10<xi<10


function [p,dp]=funCrossInTray(xx)

%constants
a=1e-4;
b=100;
c=pi;
d=1;
e=0.1;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
sx=sin(xxx);
sy=sin(yyy);
gxy=sqrt(xxx.^2+yyy.^2);
hxy=exp(abs(b-gxy./c));
kxy=abs(sx.*sy.*hxy);
p=-a*(kxy+d).^e;
%
if nargout==2
    cx=cos(xxx);
    cy=cos(yyy);
    %
    dgx=xxx./gxy;
    dgy=yyy./gxy;
    %
    dhx=hxy.*sign(b-gxy./c).*(-1/c.*dgx);
    dhy=hxy.*sign(b-gxy./c).*(-1/c.*dgy);
    %
    dkx=(cx.*sy.*hxy+sx.*sy.*dhx).*sign(sx.*sy.*hxy);
    dky=(cy.*sx.*hxy+sx.*sy.*dhy).*sign(sx.*sy.*hxy);
    %
    dp(:,:,1)=-a*e*dkx.*(kxy+d).^(e-1);
    dp(:,:,2)=-a*e*dky.*(kxy+d).^(e-1);
end
end