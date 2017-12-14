%% Bukin 2's function
%L. LAURENT -- 01/11/2016 -- luc.laurent@lecnam.net

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

function [p,dp]=funBukin02(xx)

%constants
a=100;
b=0.01;
c=1;
d=10;

%evaluation and derivatives
p=a*(xx(:,:,2)-b*xx(:,:,1).^2+c).^2+b*(xx(:,:,1)+d).^2;
if nargout==2
    dp(:,:,1)=2*b*(xx(:,:,1)+d)-a*b*4*xx(:,:,1).*(xx(:,:,2)-b*xx(:,:,1).^2+c);
    dp(:,:,2)=2*a*(xx(:,:,2)-b*xx(:,:,1).^2+c);    
end
end
