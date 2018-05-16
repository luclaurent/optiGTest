%% Pen Holder function
%L. LAURENT -- 17/11/2016 -- luc.laurent@lecnam.net

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
%4 global minimas : f(x)=-1.037845 for x=[9.646167708023526, 9.646167671043401;
%-9.646167708023526, 9.646167671043401;
%9.646167708023526, -9.646167671043401;
%-9.646167708023526, -9.646167671043401];
%
%Design space: -11<xi<11


function [p,dp]=funPenHolder(xx)

%constants
a=1;
b=pi;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
sxy=a-sqrt(xxx.^2+yyy.^2)/b;
g=exp(abs(sxy));
h=cos(xxx).*cos(yyy);
%
p=-exp(abs(g.*h).^(-1));

if nargout==2
    dgX=-1/b*sign(sxy).*xxx./sqrt(xxx.^2+yyy.^2).*g;
    dgY=-1/b*sign(sxy).*yyy./sqrt(xxx.^2+yyy.^2).*g;
    dhX=-cos(yyy).*sin(xxx);
    dhY=-sin(yyy).*cos(xxx);
    %
    dp(:,:,1)=-sign(g.*h).*(g.*h).^(-2)...
        .*(dgX.*h+dhX.*g).*p;
    dp(:,:,2)=-sign(g.*h).*(g.*h).^(-2)...
        .*(dgY.*h+dhY.*g).*p;
end
end
