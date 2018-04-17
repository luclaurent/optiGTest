%% Adjiman's function
%L. LAURENT -- 31/10/2016 -- luc.laurent@lecnam.net

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
%one local minimum
%1 global minimum : x=(2,0.10578) >> f(x)=-2.02181
%
%design space -1<x1<2, -2<x2<2



function [p,dp]=funAdjiman(xx)

%responses and derivatives
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%
cx=cos(xxx);
sy=sin(yyy);
hxy=xxx./(yyy.^2+1);
p=cx.*sy-hxy;
%
if nargout==2
    sx=sin(xxx);
    cy=cos(yyy);
    dp(:,:,1)=-sx.*sy-1./(yyy.^2+1);
    dp(:,:,2)=cx.*cy+2*xxx.*yyy./(yyy.^2+1).^2;
end
end
