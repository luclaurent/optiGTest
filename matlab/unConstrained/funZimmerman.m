%% Zimmerman function
% L. LAURENT -- 28/02/2017 -- luc.laurent@lecnam.net

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

%1 minimum global: f(7,2)=0 
%
%Design space 0<xi<100

function [p,dp] = funZimmerman(xx)

%constants
a=9;
b=3;
c=2;
d=14;
e=100;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
%
Zh1=a-x-y;
Zh2=(x-b).^2+(y-c).^2;
Zh3=x.*y-d;
Zp=@(t)e*(a+t);
%
pA(:,:,1)=Zh1;
pA(:,:,2)=Zp(Zh2).*sign(Zh2);
pA(:,:,3)=Zp(Zh3).*sign(Zh3);
pA(:,:,4)=Zp(-x).*sign(x);
pA(:,:,5)=Zp(-y).*sign(y);
%
if nargout==1
    p=max(pA,[],3);
else
    [p,Ip]=max(abs(xx),[],3);
end

if nargout==2   
    Zh1dX=-ones(size(p));
    Zh1dY=-ones(size(p));
    Zh2dX=2*(x-b);
    Zh2dY=2*(y-c);
    Zh3dX=y;
    Zh3dX=x;
    dp=zeros(size(xx));
end
end

