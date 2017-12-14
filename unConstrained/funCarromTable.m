%% CarromTable function 
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
%global minimum : f(x)=-24.15681551650653 for xi=+/- 9.646157266348881
%
%Design space: -10<xi<10


function [p,dp]=funCarromTable(xx)
%constants
a=30;
b=2;
c=1;
d=pi;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
%
xy=sqrt(x.^2+y.^2);
fxy=c-xy./d;
%
pa=exp(b*abs(fxy));
cx=cos(x);
cy=cos(y);
%
p=-1/a*pa.*cx.^2.*cy.^2;

if nargout==2
    %
    dp=-b/d*xx./xy.*sign(fxy).*p...
        +2*sin(xx).*cos(xx)./a.*pa.*cos(xx(:,:,[2 1])).^2;
end
end
