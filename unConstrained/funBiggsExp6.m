%% Biggs EXP 6's function
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
%one local minimum
%1 global minimum : x=(1, 10, 1, 5, 4 ,3) >> f(x)=0
%
%design space 0<xi<20



function [p,dp]=funBiggsExp6(xx)

%constants
a=5;
b=10;
c=3;
d=4;
nbt=11;
t=0.1.*(1:nbt);
y=exp(-t)-a*exp(-b*t)+c*exp(-d*t);

%responses and derivatives
xxx=xx(:,:,1);
yyy=xx(:,:,2);
zzz=xx(:,:,3);
lll=xx(:,:,4);
mmm=xx(:,:,5);
nnn=xx(:,:,6);


p=zeros(size(xxx));
for it=1:nbt
    p=p+(zzz.*exp(-t(it).*xxx)-lll.*exp(-t(it).*yyy)+nnn.*exp(-t(it).*mmm)-y(it)).^2;
end
if nargout==2
    dp=zeros(size(xxx,1),size(xxx,2),6);
    for it=1:nbt
        mult=zzz.*exp(-t(it).*xxx)-lll.*exp(-t(it).*yyy)+nnn.*exp(-t(it).*mmm)-y(it);
        dp(:,:,1)=dp(:,:,1)-2.*zzz.*t(it).*exp(-t(it)*xxx).*mult;
        dp(:,:,2)=dp(:,:,2)+2*lll.*t(it).*exp(-t(it)*yyy).*mult;
        dp(:,:,3)=dp(:,:,3)+2.*exp(-t(it)*xxx).*mult;
        dp(:,:,4)=dp(:,:,4)-2.*exp(-t(it)*yyy).*mult;
        dp(:,:,5)=dp(:,:,5)-2*nnn*t(it).*exp(-t(it)*mmm).*mult;
        dp(:,:,6)=dp(:,:,6)+2.*exp(-t(it)*mmm).*mult;
    end
end
end
