%% Quartic function
%L. LAURENT -- 19/11/2016 -- luc.laurent@lecnam.net

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
%global minimum : f(x)=0 for xi=(1 or 2)
%
%Design space: -10<xi<10


function [p,dp]=funQuintic(xx)

%constants
a=3;
b=4;
c=2;
d=10;
e=4;

%evaluation and derivatives
pa=xx.^5-a*xx.^4+b*xx.^3+c*xx.^2-d*xx-e;
%
p=sum(abs(pa),3);

if nargout==2    
    dp=(5*xx.^4-4*a*xx.^3+3*b*xx.^2+2*c*xx-d).*sign(pa);
end
end
