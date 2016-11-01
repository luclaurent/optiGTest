%% Bukin 12's function
%L. LAURENT -- 01/11/2016 -- luc.laurent@lecnam.net
%

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

function [p,dp]=funBukin12(xx)

%constants
a=1000;
b=5;

%evaluation and derivatives
pa=xx(:,:,1)+b;
pb=xx(:,:,2)+b;
rho=sqrt(pa.^2+pb.^2);
pc=xx(:,:,1)+b-rho.*cos(rho);
pd=xx(:,:,2)+b+rho.*sin(rho);
p=a*abs(pc)+a*abs(pd)+rho;
if nargout==2
    dRhoX=pa./rho;
    dRhoY=pb./rho;
    dp(:,:,1)=a*sign(pc).*(1+rho.*dRhoX.*sin(rho)-dRhoX.*cos(rho))...
        +a*sign(pd).*(rho.*dRhoX.*cos(rho)+dRhoX.*sin(rho))+dRhoX;
    dp(:,:,2)=a*sign(pc).*(rho.*dRhoY.*sin(rho)-dRhoY.*cos(rho))...
        +a*sign(pd).*(1+rho.*dRhoY.*cos(rho)+dRhoY.*sin(rho))+dRhoY;   
end
end

