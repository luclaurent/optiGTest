%% Beale function
%L. LAURENT -- 16/09/2011 -- luc.laurent@lecnam.net

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
%global minimum : f(x1,x2)=0 pour (x1,x2)=(3,0.5)
%
%Design space: -4.5<x1<4.5, -4.5<x<4.5



function [p,dp]=funBeale(xx)

%responses and derivatives
xxx=xx(:,:,1);
yyy=xx(:,:,2);

p = (1.5 - xxx + xxx.*yyy).^2 + (2.25 - xxx + xxx.*yyy.^2).^2 + (2.625 - xxx + xxx.*yyy.^3).^2;

if nargout==2
    dp(:,:,1)=2*(yyy-1).*(1.5-xxx+xxx.*yyy)+...
        2*(yyy.^2-1).*(2.25 - xxx + xxx.*yyy.^2) +...
        2*(yyy.^3-1).*(2.625 - xxx + xxx.*yyy.^3);
    dp(:,:,2)=2*xxx.*(1.5-xxx+xxx.*yyy)+...
        4*xxx.*yyy.*(2.25 - xxx + xxx.*yyy.^2) +...
        6*xxx.*yyy.^2.*(2.625 - xxx + xxx.*yyy.^3);
end
end