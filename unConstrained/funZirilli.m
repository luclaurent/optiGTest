%% Zirilli function
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

%1 minimum global: f(-1.0465,0)=-0.3523
%
%Design space -10<xi<10

function [p,dp] = funZirilli(xx)

%constants
a=1/4;
b=1/2;
c=0.1;
d=1/2;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
%
p=a*x.^4-b*x.^2+c*x+d*y.^2;

if nargout==2   
    dp=zeros(size(xx));
    %
    dp(:,:,1)=4*a*x.^3-2*b*x+c;
    dp(:,:,2)=2*d*y;
end
end

