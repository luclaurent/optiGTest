%% Constraint function used in problems: Simionescu
%L. LAURENT -- 02/05/2018 -- luc.laurent@lecnam.net

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

function [g,dg]=funConsSimionescu(xx)

%constants
rt=1;
rs=0.2;
n=8;

% contraint
xxx=xx(:,:,1);
yyy=xx(:,:,2);
%
t=atan2(xxx,yyy);
%
td=rt+rs.*cos(n*t);
%
g=xxx.^2+yyy.^2-td.^2;

%and their derivatives
if nargout>1
    dtx=yyy./(xxx.^2+yyy.^2);
    dty=-xxx./(xxx.^2+yyy.^2);
    %
    dg(:,:,1)=2*xxx+2*n*rs*dtx.*sin(n*t).*td;
    dg(:,:,2)=2*yyy+2*n*rs*dty.*sin(n*t).*td;
end
end
