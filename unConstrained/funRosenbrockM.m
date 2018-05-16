%% Modified Rosenbrock function
% L. LAURENT -- 14/02/2017 -- luc.laurent@lecnam.net

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

%1 minimum global: f(-1,-1)=0
%
%Design space -2<xi<2


function [p,dp] = funRosenbrockM(xx)

%constants
a=74;
b=100;
c=1;
d=400;
e=0.1;

%evaluation and derivatives
pa=(xx+c).^2./e;
calA=d*exp(-sum(pa,3));

%
p=a+b*(xx(:,:,2)-xx(:,:,1).^2).^2+(c-xx(:,:,1)).^2-calA;

if nargout==2
    %
    dp=zeros(size(xx));
    dp(:,:,1)=-4*b*xx(:,:,1).*(xx(:,:,2)-xx(:,:,1).^2)...
        -2*(c-xx(:,:,1))+...
        2/e*(xx(:,:,1)+c).*calA;
    dp(:,:,2)=2*b*(xx(:,:,2)-xx(:,:,1).^2)...
        +2/e*(xx(:,:,2)+c).*calA;
end
end
