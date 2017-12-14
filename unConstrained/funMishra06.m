%% Mishra 6 function
%L. LAURENT -- 17/11/2016 -- luc.laurent@lecnam.net

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
%global minimum : f(x)=-2.67507597 for x=(2.94777, 1.82174)
%
%Design space: -10<xi<10


function [p,dp]=funMishra06(xx)

%constants
a=1e-2;
b=1;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
g=cos(xxx)+cos(yyy);
h=sin(xxx)+sin(yyy);
kx=xxx-b;
ky=yyy-b;
pa=sin(g.^2).^2-cos(h.^2).^2+xxx;
%
p=-log(pa.^2)+a*(kx.^2+ky.^2);

if nargout==2
    dgX=-sin(xxx);
    dgY=-sin(yyy);
    dhX=cos(xxx);
    dhY=cos(yyy);
    %
    dp(:,:,1)=-2*pa.*(4*dgX.*g.*cos(g.^2).*sin(g.^2)...
        +4*dhX.*h.*sin(h.^2).*cos(h.^2)+1)./pa.^2 ...
        +2*a*kx;
    dp(:,:,2)=-2*pa.*(4*dgY.*g.*cos(g.^2).*sin(g.^2)...
        +4*dhY.*h.*sin(h.^2).*cos(h.^2))./pa.^2 ...
        +2*a*ky;
end
end
