%% Chen Bird's function
%L. LAURENT -- 04/11/2016 -- luc.laurent@lecnam.net
%
%2 global minima
%f(x1,x2)=-2000 for (x1,x2)={(0.5,0.5),(-0.5,-0.5)}
%
%Design space: -500<x1,x2<500

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


function [p,dp]=funChenBird(xx)

%constants
a=1e-3;
b=1;
c=0.5;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluations and derivatives
pa=xxx.^2+yyy.^2-b;
da=a^2+pa.^2;
pb=xxx.^2+yyy.^2-c;
db=a^2+pb.^2;
pc=xxx-yyy;
dc=a^2+pc.^2;
p=-a./da-a./db-a./dc; 

if nargout==2
    dp(:,:,1)=4*a*xxx.*pa./da.^2 ...
        +4*a*xxx.*pb./db.^2 ...
        +4*a.*pc./dc.^2;
    dp(:,:,2)=4*a*yyy.*pa./da.^2 ...
        +4*a*yyy.*pb./db.^2 ...
        -4*a.*pc./dc.^2;
end
end