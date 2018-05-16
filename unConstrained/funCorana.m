%% Corana's function
%L. LAURENT -- 05/11/2016 -- luc.laurent@lecnam.net

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
%global minimum : f(x1,x2,x3,x4)=0 for (x1,x2,x3,x4)=(0,0,0,1)
%
%Design space: -500<xi<500

function [p,dp]=funCorana(xx)

%constants
a=0.05;
b=0.2;
c=0.15;
d=[1,1e3,10,1e2];dt(1,1,1:4)=d;
e=0.49999;

%evaluation and derivatives
zz=b*floor(abs(xx)/b+e).*sign(xx);
vv=abs(xx-zz);
maskV=(vv<a);
%
nS=[size(xx,1) size(xx,2) size(xx,3)];
%
pz=zz-a*sign(zz);
dr=repmat(dt,[nS(1) nS(2) 1]);
%
pd=dr.*xx;
%
pS=zeros(nS);
pS(maskV)=pz(maskV);
pS(~maskV)=pd(~maskV);
%
p=sum(pS,3);
%
if nargout==2
fprintf('Non differentiable fnction');
dp=zeros(nS);
end
end