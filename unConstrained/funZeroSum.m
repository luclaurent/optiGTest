%% ZeroSum function
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

%1 minimum global: f(x)=0 such as Sum xi=0
%
%Design space -10<xi<10

function [p,dp] = funZeroSum(xx)

%constants
a=1;
b=10^4;
c=1/2;

%evaluation and derivatives
sumX=sum(xx,3);
%
p=a+(b*abs(sumX)).^c;
%
IX=sumX==0;
p(IX)=0;

if nargout==2   
    dp=c*b^c.*sign(sumX).*abs(sumX).^(c-1);
end
end

