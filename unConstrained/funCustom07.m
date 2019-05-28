%% Custom function 6
% L. LAURENT -- 27/05/2019 -- luc.laurent@lecnam.net

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
%global minimum : f(x)=20.6508 for x= 9.6952
%local minima
% f          | x
% 0.6204     | 73.3129
% 2.8362     | 92.2315
% 7.4016     | 321.3776
%
%
%
%Design space: -1<xi<15
%


function [p,dp]=funCustom07(xx)
%constants
a10=0.002201370;
a9=-0.1052876;
a8=2.151650;
a7=-24.60697;
a6=173.4160;
a5=-782.1379;
a4=2267.874;
a3=-4114.980;
a2=4357.030;
a1=-2327.900;
b=550;

%evaluation and derivatives
%
p = a10*xx.^10 + a9*xx.^9 + a8*xx.^8 ...
    + a7*xx.^7 + a6*xx.^6 + a5*xx.^5 ...
    + a4*xx.^4 + a3*xx.^3 + a2*xx.^2 ...
    + a1*xx + b ;

%
if nargout==2
    %
    dp=10*a10*xx.^9 + 9*a9*xx.^8 + 8*a8*xx.^7 ...
        + 7*a7*xx.^6 + 6*a6*xx.^5 + 5*a5*xx.^4 ...
        + 4*a4*xx.^3 + 3*a3*xx.^2 + 2*a2*xx ...
        + a1 ;
end
%
end