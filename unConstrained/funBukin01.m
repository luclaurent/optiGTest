%% Bukin 1's function
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

function [p,dp]=funBukin01(xx)

%constants
a=4;
b=100;
c=6;
d=8;
e=4;

%evaluation and derivatives
pa=(xx(:,:,1)-xx(:,:,2)).^2-a;
pb=c*(xx(:,:,1).^2+xx(:,:,2).^2)+d*xx(:,:,1).*xx(:,:,2)-e;
p=(pa.^2+b*pb.^2);
if nargout==2
    dp(:,:,1)=4*(xx(:,:,1)-xx(:,:,2)).*pa...
        +2*b*(2*c*xx(:,:,1)+d*xx(:,:,2)).*pb;
    dp(:,:,2)=-4*(xx(:,:,1)-xx(:,:,2)).*pa...
        +2*b*(2*c*xx(:,:,2)+d*xx(:,:,1)).*pb;
end
end
