%% Box-Betts Quadratic Sum function
%L. LAURENT -- 31/10/2016 -- luc.laurent@lecnam.net

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
%1 global minimum : x=(1, 10, 1) >> f(x)=0
%
%design space 0.9<x1,x3<1.2 and 9<x2<11.2



function [p,dp]=funBoxBetts(xx)

fprintf('TO BE FIXED\n')

%constants
a=0.1;
nbt=10;

%responses and derivatives
xxx=xx(:,:,1);
yyy=xx(:,:,2);
zzz=xx(:,:,3);

p=zeros(size(xxx));

funG=@(x1,x2,x3,j)exp(-a*j.*x1)-exp(-a*j.*x2)-(exp(-a*j)-exp(-j)).*x3;
for it=1:nbt
    p=p+funG(xxx,yyy,zzz,it).^2;
end

if nargout==2
    dp=zeros(size(xxx,1),size(xxx,2),3);
    for it=1:nbt
        dp(:,:,1)=dp(:,:,1)-a*it*exp(-a*it.*xxx);
        dp(:,:,2)=dp(:,:,2)+a*it*exp(-a*it.*yyy);
        dp(:,:,3)=dp(:,:,3)-exp(-a*it)+exp(-it);
    end
end
end

