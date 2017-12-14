%% Tripod function
% L. LAURENT -- 24/02/2017 -- luc.laurent@lecnam.net

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

%1 minimum global: f(0,-50)=0
%
%Design space -100<xi<100


function [p,dp] = funTripod(xx)

%constants
a=1;
b=50;
c=2;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
%
pX=ps(x);
pY=ps(y);
%
pa=pY.*(a+pX);
pb=x+b*pY.*(a-c*pX);
pc=y+b*(a-c*pY);
%
p=pa+abs(pb)+abs(pc);

if nargout==2
    %
    dp=zeros(size(xx));
    %
    dpX=dps(x);
    dpY=dps(y);
    %
    dp(:,:,1)=pY.*dpX+sign(pb).*(1-b*c*pY.*dpX);
    dp(:,:,2)=(a+pX).*dpY ... 
        +b*sign(pb).*dpY.*(a-c*pX) ...
        +sign(pc).*(1-b*c*dpY);      
end
end

function ev=ps(x)
    ev=ones(size(x));
    IX=(x<0);
    ev(IX)=0;
end

function ev=dps(x)
    ev=zeros(size(x));
    IX=(x==0);
    ev(IX)=1/eps;
end