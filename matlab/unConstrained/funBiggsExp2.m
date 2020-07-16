%% Biggs EXP 2's function
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
%1 global minimum : x=(1,10) >> f(x)=0
%
%design space 0<xi<20



function [p,dp]=funBiggsExp2(xx)

%constants
a=5;
b=10;
nbt=10;
t=0.1.*(1:10);
y=exp(-t)-a*exp(-b*t);

%responses and derivatives
        xxx=xx(:,:,1);
        yyy=xx(:,:,2);
        
    p=zeros(size(xxx));
    for it=1:nbt
        p=p+(exp(-t(it).*xxx)-a.*exp(-t(it).*yyy)-y(it)).^2;
    end
    if nargout==2
        dp=zeros(size(xxx,1),size(xxx,2),2);
        for it=1:nbt
            dp(:,:,1)=dp(:,:,1)-2*t(it)*exp(-t(it)*xxx).*(exp(-t(it).*xxx)-a.*exp(-t(it).*yyy)-y(it));
            dp(:,:,2)=dp(:,:,2)+2*a*t(it)*exp(-t(it)*yyy).*(exp(-t(it).*xxx)-a.*exp(-t(it).*yyy)-y(it));
        end
    end
end