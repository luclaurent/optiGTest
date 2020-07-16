%% Schwefel 6 function
% L. LAURENT -- 19/02/2017 -- luc.laurent@lecnam.net

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

%1 minimum global: f(0,...,0)=0
%
%Design space -100<xi<100


function [p,dp] = funSchwefel06(xx)

%constants
a=2;
b=5;
c=7;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
pa=x+a*y-c;
pb=a*x+y-b;
%
pTmp=zeros(size(xx));
pTmp(:,:,1)=pa;
pTmp(:,:,2)=pb;
%
if nargout==1
    p=max(abs(pTmp),[],3);
else
    [p,Ip]=max(abs(pTmp),[],3);
end

if nargout==2
    %
    dp=zeros(size(xx));
    %
    spa=sign(pa);
    spb=sign(pb);
    %
    dpX(:,:,1)=spa;
    dpX(:,:,2)=a*spb;
    dpY(:,:,1)=a*spa;
    dpY(:,:,2)=spb;
    %compute linear index
    sX=size(xx);
    rowSub=(1:sX(1))';
    colSub=1:sX(2);
    LI=sub2ind(sX,rowSub(:,ones(1,sX(2))),colSub(ones(1,sX(1)),:),Ip);
    %
    dp(:,:,1)=dpX(LI);
    dp(:,:,2)=dpY(LI);
end
end
