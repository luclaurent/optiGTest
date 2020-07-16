%% Ursem 1 function
% L. LAURENT -- 24/02/2017 -- luc.laurent@lecnam.net

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

%1 minimum global: f(1.69714,0)=-4.8168
%
%Design space -2.5<x1<3 -2<x<2

function [p,dp] = funUrsem01(xx)

%constants
a=2;
b=pi/2;
c=3;
d=1/2;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
%
pa=-sin(a*x-b);
pb=-c*cos(y);
%
p=pa+pb-d*x;

if nargout==2
    %
    dp=zeros(size(xx));
    %
    dp(:,:,1)=-a*cos(a*x-b)-d;
    dp(:,:,2)=c*sin(y);      
end
end

