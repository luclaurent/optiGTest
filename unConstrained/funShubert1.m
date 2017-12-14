%% Shubert 1 function
% L. LAURENT -- 19/02/2017 -- luc.laurent@lecnam.net

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

%1 minimum global: f(7.0835,4.8580)=-186.7309
%
%Design space -10<xi<10


function [p,dp] = funShubert1(xx)

%constants
a=5;

%evaluation and derivatives
sX=size(xx);
da=ones(1,a);
x=xx(:,:,1);x=x(:,:,da);
y=xx(:,:,2);y=y(:,:,da);
lI=1:a;
lI=reshape(lI,1,1,[]);
lI=lI(ones(1,sX(1)),ones(1,sX(2)),:);
%
fun=@(I,X)I.*cos((I+1).*X+I);
%
h=fun(lI,x);
g=fun(lI,y);
%
p=sum(h,3).*sum(g,3);

if nargout==2
    %
    dp=zeros(sX);
    funD=@(I,X)-I.*(I+1).*sin((I+1).*X+I);
    %
    dH=funD(lI,x);
    dG=funD(lI,y);
    %
    dp(:,:,1)=sum(dH,3).*sum(g,3);
    dp(:,:,2)=sum(h,3).*sum(dG,3);
end
end
