%% Bukin 20's function
%L. LAURENT -- 01/11/2016 -- luc.laurent@lecnam.net

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

function [p,dp]=funBukin20(xx)

%constants
a=1000;
b=5;
c=9;
d=0.1;
e=4;
f=6;

%evaluation and derivatives
pa=xx(:,:,2)-b*xx(:,:,1)-c;
pb=e*xx(:,:,2)+xx(:,:,1)+f;
p=a*pa.^2+d*pb.^2;
if nargout==2
    dp(:,:,1)=-2*a*b*pa+2*d*pb;
    dp(:,:,2)=2*a*pa+2*d*e*pb;   
end
end

