%% Pinter function
%L. LAURENT -- 21/03/2017 -- luc.laurent@lecnam.net

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
%global minimum : f(x)=0 for xi=0
%
%Design space: -10<xi<10
%

function [p,dp]=funPinter(xx)
%constants
a=20;
b=2;
c=3;
d=1;

%evaluation and derivatives
nbvar=size(xx,3);
%
xxm=xx(:,:,[end 1:end 1]);
%
A=xxm(:,:,1:end-2).*sin(xx)+sin(xxm(:,:,3:end));
B=xxm(:,:,1:end-2).^2-b*xx+c*xxm(:,:,3:end)-cos(xx)+d;
%
listI=reshape(1:nbvar,1,1,nbvar);
%
pa=listI.*xx.^2;
pb=a*listI.*sin(A).^2;
pc=1+listI.*B.^2;
pd=listI.*log10(pc);
%
p=sum(pa+pb+pd,3);
%
if nargout==2
    %
    dp=2*listI.*xx;
    %
    Akm=cos(xx);
    Ak=xxm(:,:,1:end-2).*cos(xx);
    Akp=sin(xxm(:,:,3:end));
    %
    Bkm=c;
    Bk=sin(xx)-b;
    Bkp=2*xx;
    %
    dp(:,:,1)=dp(:,:,1)...
        +2*a*Ak(:,:,1).*cos(A(:,:,1)).*sin(A(:,:,1))...
        +4*a*Akp(:,:,1).*cos(A(:,:,2)).*sin(A(:,:,2))...
        +2*nbvar*a*Akm(:,:,1).*cos(A(:,:,end)).*sin(A(:,:,end))...
        +2*B(:,:,1).*Bk(:,:,1)./(log(10)*pc(:,:,1))...
        +8*B(:,:,2).*Bkp(:,:,1)./(log(10)*pc(:,:,2))...
        +2*nbvar^2*B(:,:,end).*Bkm./(log(10)*pc(:,:,end));
    %
    dp(:,:,end)=dp(:,:,end)...
        +2*a*nbvar*Ak(:,:,end).*cos(A(:,:,end)).*sin(A(:,:,end))...
        +2*a*Akp(:,:,end).*cos(A(:,:,1)).*sin(A(:,:,1))...
        +2*a*(nbvar-1)*Akm(:,:,end).*cos(A(:,:,end-1)).*sin(A(:,:,end-1))...
        +2*nbvar^2*Bk(:,:,end).*B(:,:,end)./(log(10)*pc(:,:,end))...
        +2*Bkp(:,:,end).*B(:,:,1)./(log(10)*pc(:,:,1))...
        +2*(nbvar-1)^2*Bkm.*B(:,:,end-1)./(log(10)*pc(:,:,end-1));
    %
    dp(:,:,2:end-1)=dp(:,:,2:end-1)...
        +2*a*listI(:,:,2:end-1).*Ak(:,:,2:end-1).*cos(A(:,:,2:end-1)).*sin(A(:,:,2:end-1))...
        +2*a*listI(:,:,3:end).*Akp(:,:,2:end-1).*cos(A(:,:,3:end)).*sin(A(:,:,3:end))...
        +2*a*listI(:,:,1:end-2).*Akm(:,:,2:end-1).*cos(A(:,:,1:end-2)).*sin(A(:,:,1:end-2))...
        +2*listI(:,:,2:end-1).^2.*Bk(:,:,2:end-1).*B(:,:,2:end-1)./(log(10)*pc(:,:,2:end-1))...
        +2*listI(:,:,3:end).^2.*Bkp(:,:,2:end-1).*B(:,:,3:end)./(log(10)*pc(:,:,3:end))...
        +2*listI(:,:,1:end-2).^2.*Bkm.*B(:,:,1:end-2)./(log(10)*pc(:,:,1:end-2));
        
end