%% Custom function 2
%L. LAURENT -- 14/12/2017 -- luc.laurent@lecnam.net

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
%global minimum : f(x)=-0.436559 for x=2.9844
%local minimum: f(x)=0.528402 for x=9.07593
%
%Design space: -1<xi<15
%


function [p,dp,ddp]=funCustom02(xx)
%constants
a=10;
b=0;


%evaluation and derivatives
%
p=exp(-xx/a).*cos(xx)+1/a*xx+b;

%
if nargout==2
    %
    dp=-exp(-xx/a).*(sin(xx)+1/a.*cos(xx))+1/a;
end
%
if nargout==3
    %
    ddp=exp(-xx/a).*(-cos(xx)+2.*sin(xx)./a+1/a^2.*cos(xx));
end
end