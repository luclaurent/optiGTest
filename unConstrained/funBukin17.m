%% Bukin 17's function
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

function [p,dp]=funBukin17(xx)

%constants
a=1000;
b=2;
c=10;
d=3;


%evaluation and derivatives
pa=xx(:,:,2)+b*xx(:,:,1)-c;
pb=d*xx(:,:,2)-xx(:,:,1)+c;
pc=d*xx(:,:,1)-xx(:,:,2)+c;
pd=xx(:,:,1)+xx(:,:,2)+c;
p=a*abs(pa.*pb.*pc)+abs(pd);
if nargout==2
    dp(:,:,1)=a*(b*pb.*pc-pa.*pc+d*pa.*pb).*sign(pa.*pb.*pc)+sign(pd);
    dp(:,:,2)=a*(pb.*pc+d*pa.*pc-pa.*pb).*sign(pa.*pb.*pc)+sign(pd);   
end
end

