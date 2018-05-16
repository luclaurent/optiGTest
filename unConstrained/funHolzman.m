%% Holzman function
%L. LAURENT -- 16/03/2017 -- luc.laurent@lecnam.net

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
%global minimum : f(x)=0 for x=[50 25 1.5]
%
%Design space: 0<x1<100, 0<x2<25.6, 0<x3<5
%



function [p,dp]=funHolzman(xx)
%constants
a=0.01;
b=1;
c=25;
d=50;
e=2/3;
f=1e-2;
m=99;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
z=xx(:,:,3);
%
listI=reshape(0:m,1,1,m+1);
u=c+(-d.*log(f*(listI+1))).^e;
%
pa=(u-y);
pax=pa.^z;
paxx=pax./x;
pb=exp(-paxx)-a*(listI+b);  % ajustement "-paxx"
%
p=sum(pb,3);

%
if nargout==2
    %
    dp=zeros(size(xx));
    %
    dp(:,:,1)=sum(paxx./x.*exp(-paxx),3);
    dp(:,:,2)=sum(z.*pa.^(z-1)./x.*exp(-paxx),3);
    dp(:,:,3)=sum(-log(pa).*paxx.*exp(-paxx),3);
end
end
