%% Powell function
%L. LAURENT -- 23/03/2017 -- luc.laurent@lecnam.net

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
%global minimum : f(x)=0 for xi=0
%
%Design space: -4<xi<5
%

function [p,dp]=funPowell(xx)
%constants
a=10;
b=5;
c=2;
d=10;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
z=xx(:,:,3);
v=xx(:,:,4);
%
pa=z+a*x;
pb=y-v;
pc=x-c*y;
pd=z-v;
%
p=sum(pa.^2+b*pb.^2+pc.^4+d*pd.^4,3);
%
if nargout==2
    %
    dp=zeros(size(xx));
    %
    dp(:,:,1)=2*a*pa+4*pc.^3;
    dp(:,:,2)=2*b*pb-4*c*pc.^3;
    dp(:,:,3)=2*pa+4*d*pd.^3;
    dp(:,:,4)=-2*b*pb-4*d*pd.^3;
end