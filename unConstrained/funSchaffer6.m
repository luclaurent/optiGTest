%% Schaffer 06 function
%L. LAURENT -- 27/04/2017 -- luc.laurent@lecnam.net

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
%global minimum : f(x)=0 for xi=0
%
%Design space: -100<xi<100
%



function [p,dp]=funSchaffer6(xx)
%constants
a=0.5;
b=1;
c=1e-3;

%evaluation and derivatives
xi=xx(:,:,1:end-1);
xii=xx(:,:,2:end);
%
xA=xii.^2+xi.^2;
%
sqA=sqrt(xA);
sA=sin(sqA);
pA=sA.^2-a;
%
pB=b+c*xA.^2;
%
pt=pA./pB;
%
p=sum(a+pt,3);
%
if nargout==2
    %
    dp=zeros(size(xx));
    %
    cA=cos(sqA);
    %
    dp(:,:,1)=(2*xi(:,:,1)./sqA(:,:,1).*sA(:,:,1).*cA(:,:,1).*pB(:,:,1)...
        -4*c*xi(:,:,1).*xA(:,:,1).*pA(:,:,1))./pB(:,:,1).^2;
    %
    dp(:,:,end)=(2*xii(:,:,end)./sqA(:,:,end).*sA(:,:,end).*cA(:,:,end).*pB(:,:,end)...
        -4*c*xii(:,:,end).*xA(:,:,end).*pA(:,:,end))./pB(:,:,end).^2;
    %
    dp(:,:,2:end-1)=(2*xi(:,:,2:end)./sqA(:,:,2:end).*sA(:,:,2:end).*cA(:,:,2:end).*pB(:,:,2:end)...
        -4*c*xi(:,:,2:end).*xA(:,:,2:end).*pA(:,:,2:end))./pB(:,:,2:end).^2 ...
        +(2*xii(:,:,1:end-1)./sqA(:,:,1:end-1).*sA(:,:,1:end-1).*cA(:,:,1:end-1).*pB(:,:,1:end-1)...
        -4*c*xii(:,:,1:end-1).*xA(:,:,1:end-1).*pA(:,:,1:end-1))./pB(:,:,1:end-1).^2;
end
