%% Power Sum function
%L. LAURENT -- 23/03/2017 -- luc.laurent@lecnam.net

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
%global minimum : f(x)=0 for xi=[1,2,2,3]
%
%Design space: 0<xi<4
%

function [p,dp]=funPowerSum(xx)
%constants
b=[8,18,44,114];
b=reshape(b,1,1,1,4);

%evaluation and derivatives
liK=reshape(1:4,1,1,1,4);
pa=xx.^liK;
%
p=sum((sum(pa,3)-b).^2,4);
%
if nargout==2
    %
    dp=sum(2*liK.*xx.^(liK-1).*(sum(pa,3)-b),4);
end