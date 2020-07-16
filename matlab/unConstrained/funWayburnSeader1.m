%% Wayburn-Seader 1 function
% L. LAURENT -- 27/02/2017 -- luc.laurent@lecnam.net

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

%1 minimum global: f(1,2)=0
%
%Design space -pi<xi<pi

function [p,dp] = funWayburnSeader1(xx)

%constants
a=17;
b=2;
c=4;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
%
pa=x.^6+y.^4-a;
pb=b*x+y-c;
%
p=pa.^2+pb.^2;

if nargout==2
    dp=zeros(size(xx));
    dp(:,:,1)=12*x.^5.*pa+2*b*pb;
    dp(:,:,2)=8*y.^3.*pa+2*pb;
    
end
end

