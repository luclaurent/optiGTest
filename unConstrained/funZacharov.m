%% Zacharov function
% L. LAURENT -- 28/02/2017 -- luc.laurent@lecnam.net

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
%Design space -5.12<xi<5.12

function [p,dp] = funZacharov(xx)

%constants
a=1/2;

%evaluation and derivatives
sX=size(xx,3);
%
li=reshape(1:sX,1,1,[]);
pa=xx.^2;
pb=li.*xx;
pbb=sum(pb,3);
%
p=sum(pa,3)+a^2*pbb.^2+a^4*pbb.^4;

if nargout==2   
    dp=2*xx+2*a^2*li.*pbb+4*a^4*li.*pbb.^3;
end
end

