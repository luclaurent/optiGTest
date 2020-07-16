%% Quartic function
%L. LAURENT -- 19/11/2016 -- luc.laurent@lecnam.net

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
%global minimum : f(x)=NaN for xi=(0,...,0)
%
%Design space: -1.28<xi<1.28


function [p,dp]=funQuartic(xx)

%evaluation and derivatives
dim=size(xx,3);
pa=bsxfun(@times,xx.^4,reshape(1:dim,1,1,dim));
%
p=sum(pa,3)+randn(size(xx,1),size(xx,2));

if nargout==2    
    dp=4*bsxfun(@times,xx.^3,reshape(1:dim,1,1,dim));
end
end
