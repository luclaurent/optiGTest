%% Watson function
% L. LAURENT -- 27/02/2017 -- luc.laurent@lecnam.net

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

%1 minimum global: f(-0.0158,1.012,-0.2329,1.26,-1.513,0.9928)=0.002288
%
%Design space 0.25<xi<10

%% NEED TO BE FIXED

function [p,dp] = funWatson(xx)



%constants
a=29;
b=4;
c=5;
d=@(i) i/a;

%evaluation and derivatives
%
liJ=reshape(0:b,1,1,[]);
liL=reshape(0:c,1,1,[]);
%
sX=size(xx);
%
pp=zeros(sX(1),sX(2),a);
for itI=0:a
    pA=(liJ-1).*d(itI).^liJ.*xx(:,:,1:b+1);
    pB=d(itI).^liL.*xx(:,:,1:c+1);
    pp(:,:,itI+1)=sum(pA,3)-sum(pB,3).^2-1;
end
%
p=sum(pp.^2,3)+xx(:,:,1).^2;

if nargout==2
    %
    dp=zeros(sX);
    pdp=zeros(sX(1),sX(2),a);
    %
    for itI=0:a
        pB=d(itI).^liL.*xx(:,:,1:c+1);
        pdp(:,:,itI+1)=-pp(:,:,itI+1).*(1+2*sum(pB,3));
    end
    dp(:,:,1)=2*xx(:,:,1)+2*sum(pdp,3);
    %
    pdp=zeros(sX(1),sX(2),a);
    %
    for itD=2:sX(3)
        for itI=0:a
            pB=d(itI).^liL.*xx(:,:,1:c+1);
            pdp(:,:,itI+1)=pp(:,:,itI+1).*d(itI).^(itD-1).*(itD-2-2*sum(pB,3));
        end
        dp(:,:,itD)=2*sum(pdp,3);
    end
    
end
end

