%% Osyczka and Kundu 1st objective function
%L. LAURENT -- 09/05/2018 -- luc.laurent@lecnam.net

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

function [p,dp]=funObjOsyczkaKundu1(xx)

%constants
a=25;
b=2;
c=1;
d=4;

%responses and derivatives
xxx=xx(:,:,1);
yyy=xx(:,:,2);
zzz=xx(:,:,3);
uuu=xx(:,:,4);
vvv=xx(:,:,5);
%
p=-a*(xxx-b).^2 ...
    -(yyy-b).^2 ...
    -(zzz-c).^2 ...
    -(uuu-d).^2 ...
    -(vvv-c).^2;

if nargout==2
    %
    dp=zeros(size(xx));
    %
    dp(:,:,1)=-2*a*(xxx-b);
    dp(:,:,2)=-2*(yyy-b);
    dp(:,:,3)=-2*(zzz-c);
    dp(:,:,4)=-2*(uuu-d);
    dp(:,:,5)=-2*(vvv-c);
end
end
