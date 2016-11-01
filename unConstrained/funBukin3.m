%% Bukin 3's function
%L. LAURENT -- 01/11/2016 -- luc.laurent@lecnam.net
%

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

function [p,dp]=funBukin3(xx)

%constants
a=100;
b=1.5*pi;

%evaluation and derivatives
pa=(xx(:,:,2)-cos(xx(:,:,1)));
pb=xx(:,:,2)-xx(:,:,1)-b;
p=(a*pa.^2+pb.^2);
if nargout==2
    dp(:,:,1)=2*a*sin(xx(:,:,1)).*pa-2*pb;
    dp(:,:,2)=2*a*pa+2*pb;   
end
end
