%% Ursem 3 function
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

%1 minimum global: f(0,0)=-4.8168
%
%Design space -2<x1<2 -1.5<x<1.5

function [p,dp] = funUrsem3(xx)

%constants
a=2.2*pi;
b=pi/2;
c=2;
d=3;

%evaluation and derivatives
pa=-sin(a*xx+b);
pb=(c-abs(xx))./c;
pc=(d-abs(xx))./c;
%
pt=pa.*pb.*pc;
%
p=sum(pt,3);
%
if nargout==2
    %
    dpa=-a*cos(a*xx+b);
    dpb=-sign(xx)./c;
    dpc=-sign(xx)./c;
    %
    dp=dpa.*pb.*pc+pa.*dpb.*pc+pa.*pb.*dpc;
end
end

