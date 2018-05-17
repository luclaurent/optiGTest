%% Freudenstein Roth function
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
%global minimum : f(x1,x2)=0 for (5,4)
%
%Design space: -10<xi<10

function [p,dp]=funFreudensteinRoth(xx)

%constants
a=13;
b=5;
c=2;
d=29;
e=1;
f=14;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
pa=xxx-a+yyy.*((b-yyy).*yyy-c);
pb=xxx-d+((yyy+e).*yyy-f).*yyy;
p=pa.^2+pb.^2;
%
if nargout==2
    dp(:,:,1)=2*(pa+pb);
    dp(:,:,2)=2*((b-yyy).*yyy...
        -c+yyy.*(b-2*yyy)).*pa...
        +2*(yyy.*(yyy+e)-f+yyy.*(2*yyy+e)).*pb;
end
end