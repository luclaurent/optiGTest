%% Alpine's function 1
%L. LAURENT -- 31/10/2016 -- luc.laurent@lecnam.net

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
%numerous local minima
%1 global minimum : x=(0,0,...,0) >> f(x)=0
%
%design space -10<xi<10


function [p,dp]=funAlpine1(xx)

%constants
a=0.1;

%responses and derivatives
fx=xx.*sin(xx)+a*xx;
p=sum(abs(fx),3);
if nargout==2
    dp=sign(fx).*(sin(xx)+0.1+xx.*cos(xx));
end
end