%% Brown's function
%L. LAURENT -- 16/05/2012 -- luc.laurent@lecnam.net

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



function [p,dp]=funBrown(xx)

%handle functions
funG=@(x,y)exp((y.^2+1).*log(x.^2))+exp((x.^2+1).*log(y.^2));
funDxG=@(x,y)2*(y.^2+1)./x.*exp((y.^2+1).*log(x.^2))+2*x.*log(y.^2).*exp((x.^2+1).*log(y.^2));
funDyG=@(x,y)2*y.*log(x.^2).*exp((y.^2+1).*log(x.^2))+2*(x.^2+1)./y.*exp((x.^2+1).*log(y.^2));

%evaluation and derivatives
tSum=funG(xx(:,:,1:end-1),xx(:,:,2:end));
p=sum(tSum,3);
if nargout==2
    sX=size(xx);
    nbvar=sX(3);
    dp=zeros(sX);
    for ii=1:nbvar
        if ii==1
            dp(:,:,ii)=funDxG(xx(:,:,1),xx(:,:,2));
        elseif ii==nbvar
            dp(:,:,ii)=funDyG(xx(:,:,nbvar-1),xx(:,:,nbvar));
        else
            dp(:,:,ii)=funDxG(xx(:,:,ii),xx(:,:,ii+1))...
                +funDyG(xx(:,:,ii-1),xx(:,:,ii));
        end
    end
end
end
