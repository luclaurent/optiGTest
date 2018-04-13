%% Drop Wave function
%L. LAURENT -- 16/03/2017 -- luc.laurent@lecnam.net

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
%global minimum : f(x)=-1 for xi=0
%
%Design space: -5.12<xi<5.12
%



function [p,dp]=funDropWave(xx)
%constants
a=1;
b=12;
c=2;
d=1/2;

%evaluation and derivatives
sxx=sum(xx.^2,3);
pa=a+cos(b*sxx);
pb=c+d*sxx;
%
p=-pa./pb;
%

%
if nargout==2
    %
    dp=(2*b*xx.*sin(b*sxx).*pb+2*d*xx.*pa)./pb.^2;
end
end
