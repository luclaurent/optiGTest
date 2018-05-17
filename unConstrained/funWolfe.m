%% Wolfe function
% L. LAURENT -- 28/02/2017 -- luc.laurent@lecnam.net

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

%1 minimum global: f(0,0,0)=0
%
%Design space 0<xi<2

function [p,dp] = funWolfe(xx)

%constants
a=14/3;
b=0.75;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
z=xx(:,:,3);
%
p=a*(x.^2+y.^2-x.*y).^b+z;

if nargout==2
    dp=ones(size(xx));
    pb=(x.^2+y.^2-x.*y).^(b-1);
    %
    dp(:,:,1)=a*b*(2*x-y).*pb;
    dp(:,:,2)=a*b*(2*y-x).*pb;
end
end

