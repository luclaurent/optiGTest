%% Gear function
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
%global minimum : f(x)=2.7e-12 for x=[16 19 43 49]
%
%Design space: 12<xi<60
%



function [p,dp]=funGear(xx)
%constants
a=1;
b=6.931;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
z=xx(:,:,3);
w=xx(:,:,4);
%
fx=floor(x);
fy=floor(y);
fz=floor(z);
fw=floor(w);
%
p=(a/b-(fx.*fy)./(fw.*fz)).^2;

%
if nargout==2
    %
    dp=zeros(size(xx));
    %
    isInteger =@(input) (imag(input) == 0) & (round(input) == input);
    %
    dp(isInteger(xx))=1/eps;
end
end
