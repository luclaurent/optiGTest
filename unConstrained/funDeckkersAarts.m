%% Deckkers-Aarts function
%L. LAURENT -- 05/11/2016 -- luc.laurent@lecnam.net
%
%4 global minimas : f(x1,x2,x3,x4)=-24777 for {(0,-15), (0,15)}
%
%Design space: -20<xi<20

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

function [p,dp]=funDeckkersAarts(xx)

%constants
a=1e5;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
pa=a*xxx.^2+yyy.^2;
pb=xxx.^2+yyy.^2;
p=pa-pb.^2+1/a*pb.^4;
%
if nargout==2
    dp(:,:,1)=2*a*xxx-4*xxx.*pb+8/a*xxx.*pb.^3;
    dp(:,:,2)=a*yyy-4*yyy.*pb+8/a*yyy.*pb.^3;
end
end