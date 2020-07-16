%% Alpine's function 2
%L. LAURENT -- 31/10/2016 -- luc.laurent@lecnam.net

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
%1 global minimum : x=(7.917,7.917,...,7.917) >> f(x)=2.808^p
%
%design space 0<xi<10



function [p,dp]=funAlpine2(xx)

%number of variables
nbvar=size(xx,3);

%responses and derivatives
fx=sqrt(xx).*sin(xx);
p=prod(fx,3);

if nargout==2
    dp=zeros(size(xx));
    for itV=1:nbvar
        itF=[1:(itV-1) (itV+1):nbvar];
        dp(:,:,itV)=prod(fx(:,:,itF),3).*...
            (0.5./sqrt(xx(:,:,itV)).*sin(xx(:,:,itV))+sqrt(xx(:,:,itV)).*cos(xx(:,:,itV)));
    end
end
end