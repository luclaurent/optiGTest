%% Schwefel 21 function
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

%1 minimum global: f(0,...,0)=0
%
%Design space -100<xi<100


function [p,dp] = funSchwefel21(xx)

%evaluation and derivatives
pa=abs(xx);
%
if nargout==1
    p=max(pa,[],3);
else
    [p,Ip]=max(pa,[],3);
end


if nargout==2
    %
    dpTmp=sign(xx);
    %
    %compute linear index
    sX=size(xx);
    rowSub=(1:sX(1))';
    colSub=1:sX(2);
    LI=sub2ind(sX,rowSub(:,ones(1,sX(2))),colSub(ones(1,sX(1)),:),Ip);
    %
    dp=zeros(sX);
    dp(LI)=dpTmp(LI);
end
end
