%% Hosaki function
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
%global minimum : f(x1,x2)=-2.3458 for (x1,x2)=(4,2)
%
%Design space: 0<xi<5


function [p,dp]=funHosaki(xx)
%constants
a=1;
b=8;
c=7;
d=7/3;
e=1/4;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
pa=a-b*xxx+c*xxx.^2-d*xxx.^3+e*xxx.^4;
pb=exp(-yyy);
%
p=pa.*yyy.^2.*pb;

if nargout==2
    dp(:,:,1)=(-b+2*c*xxx-3*d*xxx.^2+4*e*xxx.^3).*yyy.^2.*pb;
    dp(:,:,2)=pa.*pb.*(2*yyy-yyy.^2);
end
end
