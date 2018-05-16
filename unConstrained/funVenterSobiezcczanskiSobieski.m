%% Venter-Sobiezcczanski-Sobieski function
% L. LAURENT -- 27/02/2017 -- luc.laurent@lecnam.net

% sources available here:
% https://bitbucket.org/luclaurent/optigtest/
% https://github.com/luclaurent/optigtest/

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

%1 minimum global: f(0,0)=-400
%
%Design space -50<xi<50

function [p,dp] = funVenterSobiezcczanskiSobieski(xx)

%constants
a=100;
c=30;

%evaluation and derivatives
%
cx=cos(xx);
ccx=cos(xx.^2./c);
%
pA=xx.^2-a*cx.^2-a*ccx;
%
p=sum(pA,3);

if nargout==2
    %
    sx=sin(xx);
    scx=sin(xx.^2./c);
    %
    dp=2*xx+2*a*cx.*sx+2*a/c*xx.*scx;
end
end

