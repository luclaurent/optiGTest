%% Qing function
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
%global minimum : f(x)=0 for xi=(+/-sqrt(i),...,+/-sqrt(i))
%
%Design space: -500<xi<500


function [p,dp]=funQing(xx)

%evaluation and derivatives
dim=size(xx,3);
pa=bsxfun(@minus,xx.^2,reshape(1:dim,1,1,dim));
%
p=sum(pa.^2,3);

if nargout==2    
    dp=4*xx.*pa;
end
end
