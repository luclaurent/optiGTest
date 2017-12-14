%% Bukin 15's function
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

function [p,dp]=funBukin15(xx)

%constants
a=1000;
b=10;
c=25;
d=0.1;
e=75;


%evaluation and derivatives
pa=xx(:,:,2)+xx(:,:,1).^2+b*xx(:,:,1)-c;
pb=xx(:,:,2)+b*xx(:,:,1)+e;
p=a*abs(pa)+d*abs(pb);
if nargout==2
    dp(:,:,1)=a*(2*xx(:,:,1)+b).*sign(pa)+d*b*sign(pb);
    dp(:,:,2)=a*sign(pa)+d*sign(pb);   
end
end

