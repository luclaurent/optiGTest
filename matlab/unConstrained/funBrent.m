%% Brent's function 2
%L. LAURENT -- 13/12/2010 -- luc.laurent@lecnam.net

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
% global minimum :
%f(x1,x2)=0 for (x1,x2)=(-10,-10)
%
%Design space: -10<x1,x2<10



function [p,dp]=funBrent(xx)

%constants
a=10;

%responses and derivatives
xxx=xx(:,:,1);
yyy=xx(:,:,2);

p = (xxx+a).^2+(yyy+10).^2+exp(-xxx.^2-yyy.^2);

if nargout==2
    dp(:,:,1)=2*(xxx+a)-2.*xxx.*exp(-xxx.^2-yyy.^2);
    dp(:,:,2)=2*(yyy+a)-2.*yyy.*exp(-xxx.^2-yyy.^2);
end
end