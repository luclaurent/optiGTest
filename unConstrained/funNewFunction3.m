%% New Function 3 function
%L. LAURENT -- 21/03/2017 -- luc.laurent@lecnam.net

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
%global minimum : f(x)=-1.019829 for x=[-1.9862 -10]
%
%Design space: -10<xi<10
%


function [p,dp]=funNewFunction3(xx)
%constants
a=0.01;
b=0.1;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
%
cx=cos(x);
cy=cos(y);
sx=sin(x);
sy=sin(y);
scxy=sin((cx+cy).^2);
csxy=cos((sx+sy).^2);
%
pa=(x+scxy.^2+csxy.^2);
p=a*x+b*y+pa.^2;
%
if nargout==2
    %
    dp=zeros(size(xx));
    %
    ccxy=cos((cx+cy).^2);
    ssxy=sin((sx+sy).^2);
    %
    dp(:,:,1)=a+2*pa.*(1-4*sx.*(cx+cy).*scxy.*ccxy-4*cx.*(sx+sy).*ssxy.*csxy);
    dp(:,:,2)=b+2*pa.*(-4*sy.*(cx+cy).*ccxy.*scxy-4*cy.*(sx+sy).*ssxy.*csxy);
    %
end
