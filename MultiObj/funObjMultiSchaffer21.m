%% Schaffer N2 1st objective function
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

function [p,dp]=funObjMultiSchaffer21(xx)

%constants
a=1;
b=2;
c=3;
d=4;

%responses and derivatives
IXa=find(xx<=a);
IXb=find(a<xx&xx<=c);
IXc=find(c<xx&xx<=d);
%
p=xx-d;
%
p(IXa)=-xx(IXa);
p(IXb)=xx(IXb)-b;
p(IXc)=d-xx(IXc);

if nargout==2
    %
    dp=ones(size(xx));
    %
    dp(IXa)=-dp(IXa);
    dp(IXc)=-dp(IXc);
end
end
