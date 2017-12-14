%% Deb3's function
%L. LAURENT -- 06/11/2016 -- luc.laurent@lecnam.net

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
%5^np global minimum : 
%
%design space -1<xi<1


function [p,dp]=funDeb3(xx)

%constans
a=6;
b=5*pi;
c=3/4;
d=0.05;

%evaluation and derivatives
nS=size(xx,3);
sx=sin(b*(xx.^c-d));
p=-1/nS*sum(sx.^a,3);

if nargout==2
    cx=cos(b*(xx.^c-d));
    dp=-1/nS*b*a*c*xx.^(c-1).*cx.*sx.^(a-1);
end
end
