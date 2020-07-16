%% Giunta function
%L. LAURENT -- 16/11/2016 -- luc.laurent@lecnam.net

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
%global minimum : f(x1,x2)=0.06447042053690566 for (0.4673200277395354, 0.4673200169591304)
%
%Design space: -1<xi<1

function [p,dp]=funGiunta(xx)

%constants
a=0.6;
b=16/15;
c=1;
d=1/50;
e=4;

%evaluation and derivatives
pa=sin(b*xx-c);
pb=sin(e*(b*xx-c));
pc=pa+pa.^2+d*pb;
p=a+sum(pc,3);
%
if nargout==2
    dp=b*cos(b*xx-c)+2*b*pa.*cos(b*xx-c)+d*e*b*cos(e*(b*xx-c));
end
end