%% Axis parallel hyper-ellipsoid (Weighted Sphere Model) function
%L. LAURENT -- 21/02/2012 -- luc.laurent@lecnam.net

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
%1 global minimum: x=(0,0,...,0) >> f(x)=0
%
%design space -5.12<xi<5.12



function [p,dp]=funAHE(xx)

%number of design variables
nbvar=size(xx,3);

% responses and derivatives
vv=reshape(1:nbvar,1,1,nbvar);
coef=repmat(vv,[size(xx,1) size(xx,2)]);
cal=coef.*xx.^2;
p=sum(cal,3);
if nargout==2
    dp=2*coef.*xx;
end
end
