%% Goldstein & Price function
%L. LAURENT -- 13/12/2010 -- luc.laurent@lecnam.net

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
%global minimum : f(x1,x2)=3 for (x1,x2)=(0,-1)
%
%Design space: -2<x1<2, -2<x<2


function [p,dp]=funGoldsteinPrice(xx)
%constants
a=1;
b=19;
c=14;
d=3;
e=6;
f=3;
g=30;
h=2;
k=18;
l=32;
m=12;
n=48;
o=36;
pp=27;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
qq=xxx+yyy+a;
rr=b-c*xxx+d*xxx.^2-c*yyy+e*xxx.*yyy+f*yyy.^2;
ss=h*xxx-f*yyy;
tt=k-l*xxx+m*xxx.^2+n*yyy-o*xxx.*yyy+pp*yyy.^2;
%
a = a+qq.^2.*rr;
b = g+ss.^2.*tt;
p = a.*b;

if nargout==2
    dqqX=1;
    dqqY=1;
    drrX=-c+2*d*xxx+e*yyy;
    drrY=-c+e*xxx+2*f*yyy;
    dssX=h;
    dssY=-f;
    dttX=-l+2*m*xxx-o*yyy;
    dttY=n-o*xxx+2*pp*yyy;
    %
    dp(:,:,1)=(2*dqqX.*qq.*rr+qq.^2.*drrX).*b...
        +(2*dssX.*ss.*tt+ss.^2.*dttX).*a;
    dp(:,:,2)=(2*dqqY.*qq.*rr+qq.^2.*drrY).*b...
        +(2*dssY.*ss.*tt+ss.^2.*dttY).*a;
end
end
