%% Viennet 2nd objective function
%L. LAURENT -- 09/05/2018 -- luc.laurent@lecnam.net

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

function [p,dp]=funObjViennet2(xx)

%constant
a=3;
b=2;
c=4;
d=8;
e=27;
f=15;

%responses and derivatives
xxx=xx(:,:,1);
yyy=xx(:,:,2);
%
tda=a*xxx-b*yyy+c;
tdb=xxx-yyy+1;
%
p=tda.^2./d+tdb.^2./e+f;

if nargout==2
    %
    dp(:,:,1)=2*a/d*tda+2/e*tdb;
    dp(:,:,2)=-2*b/d*tda-2/e*tdb;
    %
end
end
