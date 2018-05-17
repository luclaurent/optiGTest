%% Kursawe 2nd objective function
%L. LAURENT -- 09/05/2018 -- luc.laurent@lecnam.net

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

function [p,dp]=funObjKursawe2(xx)

%constants
a=0.8;
b=5;
c=3;

%responses and derivatives
td=abs(xx).^a+b*sin(xx.^c);
%
p=sum(td,3);

if nargout==2
    %
    dp=a*sign(xx).*abs(xx).^(a-1)+c*b*xx.^(c-1).*cos(xx.^c);
end
end
