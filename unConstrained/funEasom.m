%% Easom's function
%L. LAURENT -- 15/11/2016 -- luc.laurent@lecnam.net

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
%4 global minimas : f(x1,x2)=-1 for (pi,pi)
%
%Design space: -100<xi<100


function [p,dp]=funEasom(xx)

%constants
a=pi;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
cx=cos(xxx);
cy=cos(yyy);
xp=xxx-a;
yp=yyy-a;
exy=exp(-xp.^2-yp.^2);
p=-cx.*cy.*exy;
%
if nargout==2
    sx=sin(xxx);
    sy=sin(yyy);
    %
    dp(:,:,1)=exy.*(sx.*cy+2*xp.*cx.*cy);
    dp(:,:,2)=exy.*(sy.*cx+2*yp.*cx.*cy);
end
end