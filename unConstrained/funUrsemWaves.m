%% Ursem Waves function
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

%1 minimum global: f(1.2,1.2)=-8.5536
%
%Design space -2<xi<2

function [p,dp] = funUrsemWaves(xx)

%constants
a=0.9;
b=4.5;
c=4.7;
d=2;
e=2.5*pi;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
%
xyA=y.^2-b*y.^2;
xyB=d*x-y.^2.*(d+x);
cdxy=c*cos(xyB);
se=sin(e*x);
%
p=-a*x.^2 ...
    +xyA.*x.*y ...
    +cdxy.*se;

if nargout==2
    %
    dp=zeros(size(xx));
    %
    sdxy=sin(xyB);
    %
    dp(:,:,1)=-2*a*x+xyA.*y ...
        -c*(d-y.^2).*sdxy.*se ...
        +e*cdxy.*cos(e*x);
    dp(:,:,2)=(1-b)*3*x.*y.^2 ...
        +2*c*y.*(d+x).*sdxy.*se;
end
end

