%% Schwefel 2 function
% L. LAURENT -- 19/02/2017 -- luc.laurent@lecnam.net

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


function [p,dp] = funSchwefel02(xx)

%evaluation and derivatives
sX=[size(xx,1) size(xx,2) size(xx,3)];
p=zeros(sX(1),sX(2));
for itX=1:sX(3)
    p=p+sum(xx(:,:,1:itX),3).^2;
end

if nargout==2
    %
    dp=zeros(sX);
    for itX=1:sX(3)
        for itD=itX:sX(3)
            dp(:,:,itX)=dp(:,:,itX)+2*sum(xx(:,:,1:itD),3);
        end
    end
end
end
