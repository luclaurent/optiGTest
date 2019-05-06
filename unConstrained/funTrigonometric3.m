%% Trigonometric 3 function
% L. LAURENT -- 23/02/2017 -- luc.laurent@lecnam.net

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

%1 minimum global: f(xx,yy)=zz
%
%Design space -3<xi<3


function [p,dp] = funTrigonometric3(xx)


%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
%
p=sin(x)+cos(y);

if nargout==2
    %
    dp=zeros(size(xx));
    %
    dp(:,:,1)=cos(x);
    dp(:,:,2)=sin(x);
end
end
