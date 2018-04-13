%% Shubert 3 function
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

%1 minimum global: f(5.791794,5.791794)=-24.062499
%
%Design space -10<xi<10


function [p,dp] = funShubert3(xx)

%constants
a=5;

%evaluation and derivatives
sX=size(xx);
%
lI=1:a;
lI=reshape(lI,1,1,[]);
lI=lI(ones(1,sX(1)),ones(1,sX(2)),:);
%
fun=@(I,X)I.*sin((I+1).*X+I);
%
p=zeros(sX(1),sX(2));
%
for itX=1:sX(3)
    h=fun(lI,xx(:,:,itX));
    p=p-sum(h,3);
end

if nargout==2
    %
    dp=zeros(sX);
    funD=@(I,X)I.*(I+1).*cos((I+1).*X+I);
    %
    for itX=1:sX(3)
        dh=funD(lI,xx(:,:,itX));
        dp(:,:,itX)=-sum(dh,3);
    end
end
end
