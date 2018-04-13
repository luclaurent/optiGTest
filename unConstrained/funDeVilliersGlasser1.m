%% deVilliers Glasser 1 function
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
%Design space: -500<xi<500


function [p,dp]=funDeVilliersGlasser1(xx)

%constants
a=24;
b=0.1;
c=1;
d=60.137;
f=1.371;
g=3.112;
h=1.761;
%
ii=1:a;
t=reshape(b*(ii-c),[1,1,a]);
y=d*f.^t.*(sin(g*t+h));

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);
zzz=xx(:,:,3);
vvv=xx(:,:,4);

%evaluation and derivatives
zt=bsxfun(@times,zzz,t);
ztv=bsxfun(@plus,zt,vvv);
szv=sin(ztv);
%
yt=bsxfun(@power,yyy,t);
xyt=bsxfun(@times,yt,xxx);
%
pa=szv.*xyt;
pb=bsxfun(@minus,pa,y);
%
p=sum(pb.^2,3);
%
if nargout==2
    xt=bsxfun(@times,xxx,t);
    ytm=bsxfun(@power,yyy,t-1);
    czv=cos(ztv);
    %
    dp(:,:,1)=sum(2*yt.*szv.*pb,3);    
    dp(:,:,2)=sum(2*xt.*ytm.*szv.*pb,3);
    dp(:,:,3)=sum(2*xt.*yt.*czv.*pb,3);
    dp(:,:,4)=sum(2*xyt.*czv.*pb,3);
end
end