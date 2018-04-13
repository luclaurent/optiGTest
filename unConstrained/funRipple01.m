%% Ripple 25 function
%L. LAURENT -- 12/02/2017 -- luc.laurent@lecnam.net

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
%1 minimum global: x=0 >> f(-0.1,-0.1)=-2.2
%
%Design space 0<xi<1

function [p,dp]=funRipple01(xx)

%constants
a=2;
b=0.1;
c=0.8;
d=5*pi;
e=500*pi;

%evaluation and derivatives
pa=(xx-b)./c;
pb=-a*log(a)*pa.^2;
pc=-exp(pb);
sd=sin(d*xx);
ce=cos(e*xx);
pd=sd.^6+b*ce.^2;
cal=pc.*pd;
%
p=sum(cal,3);

if nargout==2
    dpd=6*d*sd.^5.*cos(d*xx)-2*e*b*ce.*sin(e*xx);
    dpb=-2*a*log(a).*pa.*pc./c;
    %
    dp=dpb.*pd+pc.*dpd;
end

end