%% Wavy function
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

%1 minimum global: f(0,...,0)=0
%
%Design space -pi<xi<pi

function [p,dp] = funWavy(xx)

%constants
a=1;
b=1/2;
k=10;
nbvar=size(xx,3);

%evaluation and derivatives
cx=cos(k*xx);
ex=exp(-b*xx.^2);
pcx=cx.*ex;
%
p=a-1/nbvar.*sum(pcx,3);

if nargout==2
    %
    sx=sin(k*xx);
    %
    dp=1/nbvar*ex.*(k*sx+xx.*cx);
    
end
end

