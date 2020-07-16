%% Stochastic function
% L. LAURENT -- 20/02/2017 -- luc.laurent@lecnam.net

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

%1 minimum global: f(1,1/2,1/3,...,1/n)=0
%
%Design space -5<xi<5


function [p,dp] = funStochastic(xx)

%evaluation and derivatives
sX=size(xx);
%
lI=1:sX(3);
lI=reshape(lI,1,1,[]);
%
pa=xx-1./lI;
rEps=rand(sX);
pb=rEps.*abs(pa);
%
p=sum(pb,3);

if nargout==2
    %
    dp=rEps.*sign(pa);
end
end
