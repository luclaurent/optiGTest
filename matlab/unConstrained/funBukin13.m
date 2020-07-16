%% Bukin 13's function
%L. LAURENT -- 01/11/2016 -- luc.laurent@lecnam.net

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

function [p,dp]=funBukin13(xx)

%constants
a=100;
b=3;
c=0.5;

%evaluation and derivatives
pa=xx(:,:,1)+b;
pb=xx(:,:,2)-c;
rho=sqrt(pa.^2+pb.^2);
m=sin(b*rho).*pa-cos(b*rho).*pb;
p=rho+a./rho.^2.*m.^2;
if nargout==2
    dRhoX=pa./rho;
    dRhoY=pb./rho;
    dp(:,:,1)=dRhoX-2*a./rho.^3.*dRhoX.*(m.^2)...
        +2*a./rho.^2.*(b*dRhoX.*cos(b*rho).*pa+sin(b*rho)+b*dRhoX.*sin(b*rho).*pb).*m;
    dp(:,:,2)=dRhoY-2*a./rho.^3.*dRhoY.*(m.^2)...
        +2*a./rho.^2.*(b*dRhoY.*cos(b*rho).*pa-cos(b*rho)+b*dRhoY.*sin(b*rho).*pb).*m;   
end
end

