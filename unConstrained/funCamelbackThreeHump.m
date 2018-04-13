%% Three-Hump camel back function
%L. LAURENT -- 04/11/2016 -- luc.laurent@lecnam.net

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
%1 local minimum
%f(x1,x2)=0 for (x1,x2)=(0,0)
%
%Design space: -5<x1<5 -5<x2<5


function [p,dp]=funCamelbackThreeHump(xx)

%constants
a=2;
b=1.05;
c=6;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluations and derivatives
p=a.*xxx.^2 ...
    -b*xxx.^4 ...
    +xxx.^6./c ...
    +xxx.*yyy...
    +yyy.^2;   
    
if nargout==2
    dp(:,:,1)=2*a*xxx...
        -4*b*xxx.^3 ...
        +6/c*xxx.^5 ...
        +yyy;
    dp(:,:,2)=xxx...
        +2*yyy;
end
end