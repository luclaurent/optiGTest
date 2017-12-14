%% Dolan's function
%L. LAURENT -- 15/11/2016 -- luc.laurent@lecnam.net

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
%4 global minimas : f(x1,x2,x3,x4)=0 
%
%Design space: -100<xi<100


function [p,dp]=funDolan(xx)

%constants
a=1.7;
b=01.5;
c=0.1;
d=0.2;
e=1;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);
zzz=xx(:,:,3);
vvv=xx(:,:,4);
www=xx(:,:,5);

%evaluation and derivatives
pa=xxx+a*yyy;
pb=sin(xxx);
pc=b*zzz;
pd=c*vvv;
pe=cos(vvv+www-xxx);
pf=d*www.^2-yyy-e;
%
pt=pa.*pb-pc-pd.*pe+pf;
p=abs(pt);
%
if nargout==2
    sf=sign(pt);
    %
    dp(:,:,1)=sf.*(cos(xxx).*pa+pb-pd.*sin(vvv+www-xxx));
    dp(:,:,2)=sf.*(a*pb-1);
    dp(:,:,3)=-sf.*b;
    dp(:,:,4)=sf.*(-c*pe+pd.*sin(vvv+www-xxx));
    dp(:,:,5)=sf.*(pd.*sin(vvv+www-xxx)+2*d*www);
end
end