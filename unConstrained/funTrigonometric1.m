%% Trigonometric 1 function
% L. LAURENT -- 23/02/2017 -- luc.laurent@lecnam.net

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
%Design space 0<xi<pi


function [p,dp] = funTrigonometric1(xx)

%constants
nbvar=size(xx,3);

%evaluation and derivatives
cx=cos(xx);
sx=sin(xx);
%
lI=reshape(1:nbvar,1,1,nbvar);
%
sumcx=sum(cx+lI.*(1-cx-sx),3);
%
pa=nbvar-sumcx(:,:,ones(1,nbvar));
%
p=sum(pa.^2,3);

if nargout==2
    %
    dp=2*pa.*(sx+lI.*(-sx+cx))*nbvar;
end
end
