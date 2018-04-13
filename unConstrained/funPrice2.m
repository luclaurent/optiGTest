%% Price 2 function
%L. LAURENT -- 17/11/2016 -- luc.laurent@lecnam.net

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
%global minimum : f(x)=0.9 for x=(0,0)
%
%Design space: -10<xi<10


function [p,dp]=funPrice2(xx)

%constants
a=1;
b=0.1;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
sx=sin(xxx);
sy=sin(yyy);
ex=exp(-xxx.^2-yyy.^2);
%
p=a+sx.^2+sy.^2-b*ex;

if nargout==2
    dp(:,:,1)=2*sx.*cos(xxx)+2*b*xxx.*ex;
    dp(:,:,2)=2*sy.*cos(yyy)+2*b*yyy.*ex;
end
end
