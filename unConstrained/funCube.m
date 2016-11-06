%% Cube's function
%L. LAURENT -- 05/11/2016 -- luc.laurent@lecnam.net
%
%4 global minimas : f(x1,x2,x3,x4)=0 for (-1,1)
%
%Design space: -10<xi<10

%     GRENAT - GRadient ENhanced Approximation Toolbox
%     A toolbox for generating and exploiting gradient-enhanced surrogate models
%     Copyright (C) 2016  Luc LAURENT <luc.laurent@lecnam.net>
%
%     This program is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
%
%     This program is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
%
%     You should have received a copy of the GNU General Public License
%     along with this program.  If not, see <http://www.gnu.org/licenses/>.

function [p,dp]=funCube(xx)

%constants
a=100;
b=1;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
pa=yyy-xxx.^2;
pb=b-xxx;
p=a*pa.^2+pb.^2;
%
if nargout==2
    dp(:,:,1)=-6*a*xxx.^2.*pa-2*pb;
    dp(:,:,2)=2*a*pa;
end
end