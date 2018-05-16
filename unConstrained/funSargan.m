%% Sargan function
% L. LAURENT -- 14/02/2017 -- luc.laurent@lecnam.net

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
%Design space -100<xi<100


function [p,dp] = funSargan(xx)

%constants
a=0.4;

%evaluation and derivatives
nbX=size(xx);
pxy=zeros(nbX(1),nbX(2));
ppxy=zeros(nbX(1),nbX(2));
for itN=1:nbX(3)
    for itM=1:itN-1
        pxy=pxy+2*xx(:,:,itM).*xx(:,:,itN);
    end
end

p=nbX(3)*(sum(xx.^2,3)+a*pxy);

if nargout==2
    %
    sxy=sum(xx,3);
    dxy=sxy(:,:,ones(1,nbX(3)))-xx;
    dp=nbX(3)*(2*xx+2*a*dxy);
end
end
