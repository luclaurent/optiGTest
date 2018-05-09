%% Zitzler-Deb-Thiele N3 2nd objective function
%L. LAURENT -- 09/05/2018 -- luc.laurent@lecnam.net

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

function [p,dp]=funObjZitzlerDebThiele32(xx)

%constants
a=9/29;
b=10*pi;

%responses and derivatives
f1=xx(:,:,1);
g=1+a*sum(xx(:,:,2:end),3);
%
rfg=f1./g;
h=1-sqrt(rfg)-rfg.*sin(b*f1);
%
p=g.*h;

if nargout==2
    %
    df1=zeros(size(xx));
    df1(:,:,1)=ones(size(xx,1),size(xx,2));    
    %
    dg=a*ones(size(xx));
    dg(:,:,1)=0;
    %
    drfg=(df1.*g-f1.*g)./g.^2;
    %
    dh=drfg.*0.5/sqrt(rfg)...
        -rfg.*b.*df1.*cos(b*f1)-dfrg.*sin(b*f1);
    %
    dp=dg.*h+g.*dh;
end
end
