%% Salomon function
% L. LAURENT -- 14/02/2017 -- luc.laurent@lecnam.net

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


function [p,dp] = funSalomon(xx)

%constants
a=1;
b=2*pi;
c=0.1;

%evaluation and derivatives
sumx=sum(xx.^2,3);
sqx=sqrt(sumx);
%
p=a-cos(b*sqx)+c*sqx;

if nargout==2
    %
    ds=xx./sqx;
    dp=ds.*(b*sin(b*sqx)+c);
end
end
