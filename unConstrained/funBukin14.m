%% Bukin 14's function
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

function [p,dp]=funBukin14(xx)

%constants
a=1000;
b=1e-3;
c=11;

%evaluation and derivatives
pa=xx(:,:,2)-b*xx(:,:,1).^3;
pb=xx(:,:,2)+xx(:,:,1)+c;
p=a*abs(pa)+abs(pb);
if nargout==2
    dp(:,:,1)=-3*a*b*xx(:,:,1).^2.*sign(pa)+sign(pb);
    dp(:,:,2)=a*sign(pa)+sign(pb);   
end
end

