%% Michalewicz function
% L. LAURENT -- 16/09/2011 -- luc.laurent@lecnam.net

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
%global minimum: depend of the number of variables
%
%Design space: 0<xi<pi



function [p,dp] = funMichalewicz(xx)

% number of design variables
sX=size(xx);
nbvar=sX(3);

p=zeros(sX(1),sX(2));
for iter=1:nbvar
    p=p+sin(xx(:,:,iter)).*sin(iter*xx(:,:,iter).^2/pi).^20;
end
p=-p;
if nargout==2
    dp=zeros(size(xx));
    for iter=1:nbvar
        dp(:,:,iter)=cos(xx(:,:,iter)).*sin(iter*xx(:,:,iter).^2/pi).^20+...
            40*iter/pi*xx(:,:,iter).*sin(xx(:,:,iter)).*cos(iter*xx(:,:,iter).^2/pi).^19;
    end
    dp=-dp;
end
end
