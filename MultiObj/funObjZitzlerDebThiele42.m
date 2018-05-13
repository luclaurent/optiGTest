%% Zitzler-Deb-Thiele N4 2nd objective function
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

function [p,dp]=funObjZitzlerDebThiele42(xx)

%constants
a=91;
b=10;
c=4*pi;

%responses and derivatives
f1=xx(:,:,1);
%
cx=cos(c*xx(:,:,2:end));
td=xx(:,:,2:end).^2-b*cx;
g=a+sum(td,3);
%
rfg=f1./g;
h=1-sqrt(rfg);
%
p=g.*h;

if nargout==2
    %
    df1=zeros(size(xx));
    df1(:,:,1)=ones(size(xx,1),size(xx,2));    
    %
    dg=2*xx+b*c*sin(c*xx);
    dg(:,:,1)=0;
    %
    drfg=(df1.*g-f1.*dg)./g.^2;
    %
    dh=-drfg.*0.5./sqrt(rfg);
    %
    dp=dg.*h+g.*dh;
end
end
