%% Chung Reynolds's function
%L. LAURENT -- 04/11/2016 -- luc.laurent@lecnam.net

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

%
%numerous local minima
%1 global minimum : x=(0,0,...,0) >> f(x)=0
%
%design space -1<xi<4



function [p,dp]=funChungReynolds(xx)


%evaluation and derivatives
pSum=sum(xx.^2,3);
p=pSum.^2;
if nargout==2
    dp=4*xx.*repmat(pSum,[1 1 size(xx,3)]);
end
end
