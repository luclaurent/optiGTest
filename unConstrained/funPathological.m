%% Pathological function
%L. LAURENT -- 21/03/2017 -- luc.laurent@lecnam.net

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
%global minimum : f(x)=-1 for xi=0
%
%Design space: -100<xi<100
%



function [p,dp]=funPathological(xx)
%constants
a=100;
b=1/2;
c=1e-3;

%evaluation and derivatives
xi=xx(:,:,1:end-1);
xii=xx(:,:,2:end);
%
xA=a*xii.^2+xi.^2;
xB=xi-xii;
%
sqA=sqrt(xA);
sA=sin(sqA);
pA=sA.^2-b;
%
pB=c*xB.^4+b;
%
pt=pA./pB;
%
p=sum(pt,3);
%
if nargout==2
    %
    dp=zeros(size(xx));
    %
    cA=cos(sqA);
    %
    dp(:,:,1)=(2*xx(:,:,1)./sqA(:,:,1).*sA(:,:,1).*cA(:,:,1).*pB(:,:,1)...
        -4*c*xB(:,:,1).^3.*pA(:,:,1))./pB(:,:,1).^2;
    %
    dp(:,:,end)=(2*a*xx(:,:,end)./sqA(:,:,end).*sA(:,:,end).*cA(:,:,end).*pB(:,:,end)...
        +4*c*xB(:,:,end).^3.*pA(:,:,end))./pB(:,:,end).^2;
    %
    dp(:,:,2:end-1)=(2*xx(:,:,2:end-1)./sqA(:,:,2:end).*sA(:,:,2:end).*cA(:,:,2:end).*pB(:,:,2:end)...
        -4*c*xB(:,:,2:end).^3.*pA(:,:,2:end))./pB(:,:,2:end).^2 ...
        +(2*a*xx(:,:,2:end-1)./sqA(:,:,1:end-1).*sA(:,:,1:end-1).*cA(:,:,1:end-1).*pB(:,:,1:end-1)...
        +4*c*xB(:,:,1:end-1).^3.*pA(:,:,1:end-1))./pB(:,:,1:end-1).^2;
end
