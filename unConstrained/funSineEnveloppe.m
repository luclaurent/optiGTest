%% Sine Enveloppe function
% L. LAURENT -- 20/02/2017 -- luc.laurent@lecnam.net

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


function [p,dp] = funSineEnveloppe(xx)

%constants
a=1/2;
b=1e-3;
c=1;

%evaluation and derivatives
sX=size(xx);
%
funH=@(x,y)sin(sqrt(x.^2+y.^2)).^2-a;
funG=@(x,y)(b*(x.^2+y.^2)+c).^2;
%
xkp=xx(:,:,2:end);
xk=xx(:,:,1:end-1);
pa=funH(xkp,xk)./funG(xkp,xk)+a;
%
p=sum(pa,3);

if nargout==2
    %
    funHx=@(x,y)2*x./sqrt(x.^2+y.^2) ...
        .*cos(sqrt(x.^2+y.^2)) ...
        .*sin(sqrt(x.^2+y.^2));
    funHy=@(x,y)2*y./sqrt(x.^2+y.^2) ...
        .*cos(sqrt(x.^2+y.^2)) ...
        .*sin(sqrt(x.^2+y.^2));
    funGx=@(x,y)4*b*x.*(b*(x.^2+y.^2)+c);
    funGy=@(x,y)4*b*y.*(b*(x.^2+y.^2)+c);
    %
    dp=zeros(sX);
    %
    for itX=1:sX(3)
        if itX==1
            x=xx(:,:,2);
            y=xx(:,:,1);
            dp(:,:,itX)=(funHy(x,y).*funG(x,y)-funH(x,y).*funGy(x,y))./funG(x,y).^2;
        elseif itX==sX(3)
            x=xx(:,:,sX(3));
            y=xx(:,:,sX(3)-1);
            dp(:,:,itX)=(funHx(x,y).*funG(x,y)-funH(x,y).*funGx(x,y))./funG(x,y).^2;
        else
            xk=xx(:,:,itX);
            xkp=xx(:,:,itX+1);
            xkm=xx(:,:,itX-1);
            dp(:,:,itX)=(funHx(xk,xkm).*funG(xk,xkm)-funH(xk,xkm).*funGx(xk,xkm))./funG(xk,xkm).^2 ...
                +(funHy(xkp,xk).*funG(xkp,xk)-funH(xkp,xk).*funGy(xkp,xk))./funG(xkp,xk).^2;
        end
    end
end
end
