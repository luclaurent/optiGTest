%% Rosenbrock function constrained with a cubic and a line
%L. LAURENT -- 16/04/2018 -- luc.laurent@lecnam.net

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
%numerous local minima
%1 global minimum : x=(1,1) >> f(x)=0
%
%design space   -1.5<x1<1.5 
%               -0.5<x2<2.5

function [p,g,dp,dg]=probRosenbrockCubicLine(xx)

%use the existing 2-dimenstion Rosenbrock's function
if nargout>2
    [p,dp]=funRosenbrock(xx);
else
    p=funRosenbrock(xx);
end

% two contraints
if nargout>1
tmp1=(xx(:,:,1)-1).^3-xx(:,:,2)+1;
tmp2=xx(:,:,1)+xx(:,:,2)-2;
%
g{1}=tmp1;
g{2}=tmp2;
end
%and their derivatives
if nargout>3
    nX=size(xx);
    %
    dtmp1(:,:,1)=3*(xx(:,:,1)-1).^2;
    dtmp1(:,:,2)=-ones(nX(1),nX(2));
    %
    dtmp2=ones(nX(1),nX(2),2);
    %
    dg{1}=dtmp1;
    dg{2}=dtmp2;
end
end
