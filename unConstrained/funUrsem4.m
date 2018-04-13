%% Ursem 4 function
% L. LAURENT -- 24/02/2017 -- luc.laurent@lecnam.net

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

%1 minimum global: f(0,0)=-1,5
%
%Design space -2<xi<2

function [p,dp] = funUrsem4(xx)

%constants
a=3;
b=pi/2;
c=pi/2;
d=2;
e=4;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
%
sxy=sqrt(x.^2+y.^2);
%
pa=-a*sin(b*x+c);
pb=(d-sxy)./e;
%
pt=pa.*pb;
%
p=sum(pt,3);

if nargout==2
    %
    dp=zeros(size(xx));
    %
    dp(:,:,1)=-a*b*cos(b*x+c).*pb-pa.*x./(e*sxy);
    dp(:,:,2)=-pa.*y./(e*sxy);
end
end

