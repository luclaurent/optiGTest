%% Shekel 10 function
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

%1 minimum global: f(4,4,4,4)=-10.53628
%
%Design space 0<xi<10


function [p,dp] = funShekel10(xx)

%constants
a=[
    4 4 4 4
    1 1 1 1
    8 8 8 8
    6 6 6 6
    3 7 3 7
    2 9 2 9
    5 5 3 3
    8 1 8 1
    6 2 6 2
    7 3.6 7 3.6
    ];
c=0.1*[1 2 2 4 4 6 3 7 5 5]';
m=10;

%evaluation and derivatives
sX=[size(xx,1) size(xx,2) size(xx,3)];
p=zeros(sX(1),sX(2));
for itI=1:m
    aI=a(itI,:);
    aR=reshape(aI,1,1,[]);
    pTmp=xx-aR(ones(1,sX(1)),ones(1:sX(2)),:);
    hI=c(itI)+sum(pTmp.^2,3);
    p=p-1./hI;
end


if nargout==2
    %
    dp=zeros(sX);
    for itI=1:m
        aI=a(itI,:);
        aR=reshape(aI,1,1,[]);
        pTmp=xx-aR(ones(1,sX(1)),ones(1:sX(2)),:);
        hI=c(itI)+sum(pTmp.^2,3);
        dhI=2*pTmp;
        dp=dp+dhI./hI.^2;
    end
end
end
