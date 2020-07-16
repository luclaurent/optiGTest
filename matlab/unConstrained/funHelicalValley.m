%% Helical Valley function
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
%global minimum : f(x1,x2,x3)=0 for (x1,x2,x3)=(1,0,0)
%
%Design space: -10<xi<10


function [p,dp]=funHelicalValley(xx)
%constants
a=100;
b=10;
c=1;
d=1/(2*pi);

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);
zzz=xx(:,:,3);

%evaluation and derivatives
th=atan2(yyy,xxx)*d;
pa=yyy-b*th;
pb=sqrt(xxx.^2+yyy.^2)-c;
%
p=a*(pa.^2+pb.^2)+zzz.^2;

if nargout==2
    dthX=-d*yyy./(xxx.^2+yyy.^2);
    dthY=d.*xxx./(xxx.^2+yyy.^2);
    pbX=2*a*xxx./sqrt(xxx.^2+yyy.^2).*pb;
    pbY=2*a*yyy./sqrt(xxx.^2+yyy.^2).*pb;
    paX=-2*a*b*dthX.*pa;
    paY=2*a*(1-b*dthY).*pa;
    %
    dp(:,:,1)=paX+pbX;
    dp(:,:,2)=paY+pbY;  
    dp(:,:,3)=2*zzz;
end
end
