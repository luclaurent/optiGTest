%% EX1 function
%L. LAURENT -- 16/11/2016 -- luc.laurent@lecnam.net

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
%global minimum : f(x1,x2)=-1.28186 for (1.764,11.15)
%
%Design space: 0<xi<12

function [p,dp]=funEX1(xx)

%constants
a=0.1;
b=1;
c=10;
d=11;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
p=a*(b-xxx.^2)+a*sin(c*xxx)+(d-yyy).^2+sin(c*yyy);
%
if nargout==2
    dp(:,:,1)=-2*xxx*a+a*c*cos(c*xxx);
    dp(:,:,2)=-2*(d-yyy)+c*cos(c*yyy);
end
end