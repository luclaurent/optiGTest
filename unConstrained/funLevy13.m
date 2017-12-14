%% Levy 13 function
%L. LAURENT -- 17/03/2017 -- luc.laurent@lecnam.net

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
%global minimum : f(x)=0 for xi=1
%
%Design space: -10<xi<10
%


function [p,dp]=funLevy13(xx)
%constants
a=1;
b=3*pi;
c=2*pi;


%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
%
pa=sin(b*y).^2+a;
pb=sin(c*y).^2+a;
pc=x-a;
pd=y-a;
pe=sin(b*x);
%
p=pc.^2.*pa+pd.^2.*pb+pe.^2;

%
if nargout==2
    %
    dp=zeros(size(xx));
    %
    dp(:,:,1)=2*pc.*pa+2*b*pe.*cos(b*x);
    dp(:,:,2)=2*b.*pc.^2.*sin(b*y).*cos(b*y)...
        +2*pd.*pb...
        +2*c*pd.^2.*sin(c*y).*cos(c*y);
end
