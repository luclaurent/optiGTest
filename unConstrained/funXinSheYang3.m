%% Xin-She-Yang 3 function
% L. LAURENT -- 28/02/2017 -- luc.laurent@lecnam.net

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

%1 minimum global: f(0,...,0)=-1
%
%Design space -20<xi<20

function [p,dp] = funXinSheYang3(xx)

%constants
a=2;
m=3;
beta=15;

%evaluation and derivatives
pa=xx./beta;
pA=sum(pa.^(2*m),3);
pAA=exp(-pA);
%
pb=xx.^2;
pB=sum(pb,3);
pBB=exp(-pB);
%
pc=cos(xx).^2;
pCC=prod(pc,3);
%
p=pAA-a*pBB.*pCC;

if nargout==2
    dp=-2*m/beta^(2*m)*xx.^(2*m-1).*pAA ...
        + 2*a*xx.*pBB.*pCC ...
        +2*a*sin(xx).*pBB.*pCC./cos(xx); %could required specific writing for dealing with NaN values
end
end

