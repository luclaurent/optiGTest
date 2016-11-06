%% Damavandi's function
%L. LAURENT -- 05/11/2016 -- luc.laurent@lecnam.net
%
%1 global minimum : f(2,2)=0 
%
%Design space: 0<xi<14

%     GRENAT - GRadient ENhanced Approximation Toolbox
%     A toolbox for generating and exploiting gradient-enhanced surrogate models
%     Copyright (C) 2016  Luc LAURENT <luc.laurent@lecnam.net>
%
%     This program is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
%
%     This program is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
%
%     You should have received a copy of the GNU General Public License
%     along with this program.  If not, see <http://www.gnu.org/licenses/>.

function [p,dp]=funDamavandi(xx)

%constants
a=1;
b=pi;
c=2;
d=7;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
pax=xxx-c;
pay=yyy-c;
sx=sin(b*pax);
sy=sin(b*pay);
kxy=sx.*sy./(b^2*pax.*pay);
%
pbx=xxx-d;
pby=yyy-d;
hxy=c+pbx.^2+b*pby.^2;
%
p=(a-abs(kxy).^5).*hxy;
%
if nargout==2
    cx=cos(b*pax);
    cy=cos(b*pay);
    %
    dkx=b*cx.*sy./(b^2*pax.*pay)+b^2*pax.*kxy./(b^2*pax.*pay);
    dky=b*cy.*sx./(b^2*pax.*pay)+b^2*pbx.*kxy./(b^2*pax.*pay);
    %
    dhx=2*pbx;
    dhy=2*pby;
    %
    dp(:,:,1)=dhx.*(a-abs(kxy).^5)-5*dkx.*sign(kxy).*kxy.^4.*hxy;
    dp(:,:,2)=dhy.*(a-abs(kxy).^5)-5*dky.*sign(kxy).*kxy.^4.*hxy;
end
end