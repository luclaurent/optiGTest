%% McCormick's function
%L. LAURENT -- 17/11/2016 -- luc.laurent@lecnam.net

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
%global minimum : f(x1,x2)=-1.9133 for (x1,x2)=(?0.547,?1.547)
%
%Design space: -1.5<x1<4 & -3<x2<3


function [p,dp]=funMcCormick(xx)
%constants
a=3/2;
b=5/2;
c=1;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
pa=xxx-yyy;
pb=xxx+yyy;
p=sin(pb)+pa.^2-a*xxx+b*yyy+c;

if nargout==2
    dp(:,:,1)=cos(pb)+2*pa-a;
    dp(:,:,2)=cos(pb)-2*pa+b;
end
end
