%% Bukin 19's function
%L. LAURENT -- 01/11/2016 -- luc.laurent@lecnam.net

% sources available here:
% https://bitbucket.org/luclaurent/optigtest/
% https://github.com/luclaurent/optigtest/

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

function [p,dp]=funBukin19(xx)

%constants
a=1000;
b=10;
c=0.1;
d=62;

%evaluation and derivatives
pa=xx(:,:,2)-xx(:,:,1).^2+b;
pb=xx(:,:,2)-xx(:,:,1)-d;
p=a*abs(pa)+c*abs(pb);
if nargout==2
    dp(:,:,1)=-2*a*xx(:,:,1).*sign(pa)-c*sign(pb);
    dp(:,:,2)=a*sign(pa)+c*sign(pb);   
end
end

