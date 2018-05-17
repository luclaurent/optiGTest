%% Schwefel 26 function
%L. LAURENT -- 26/01/2011 -- luc.laurent@lecnam.net
%modif on the 16/09/2011 -- change to n variables
%
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

%numerous local minima
%1 global minimum : x=(420.968746,420.968746,...,420.968746) >> f(x)=0
%
%Design space: -500<xi<500

function [p,dp]=funSchwefel26(xx)

%constants
a=418.9829;
nbvar=size(xx,3);

%evaluation and derivatives
pa=abs(xx);
sqa=sqrt(pa);
ssqa=sin(sqa);
pb=xx.*ssqa;
%
p=a*nbvar-sum(pb,3);
%
if nargout==2
    %
    csqa=cos(sqa);
    dp=-ssqa-xx.*sign(xx).*csqa./(2*sqa);
    iXZ=(abs(xx(:))<eps);
    dp(iXZ)=0;
end

end
