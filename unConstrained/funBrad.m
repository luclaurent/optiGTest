%% Bard's function
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
%1 global minimum : x=(0.0824, 1.133, 2.3437) >> f(x)=0.00821487
%
%design space -0.25<x1<0.25, 0.01<x2,x3<2.5



function [p,dp]=funBrad(xx)
fprintf('NE TO BE DEBUGGED\n');
%constants
nbt=15;
u=1:nbt;
v=16-u;
w=min([u',v'],[],2);
y=[0.14, 0.18, 0.22, 0.25, 0.29, 0.32, 0.35, 0.39, 0.37, 0.58, 0.73, 0.96, 1.34, 2.10, 4.39];

%responses and derivatives
xxx=xx(:,:,1);
yyy=xx(:,:,2);
zzz=xx(:,:,3);

p=zeros(size(xxx));
for it=1:nbt
    p=p+((y(it)-xxx-u(it))./(v(it).*yyy+w(it).*zzz)).^2;
end
if nargout==2
    dp=zeros(size(xxx,1),size(xxx,2),3);
    for it=1:nbt
        mult=(y(it)-xxx-u(it))./(v(it).*yyy+w(it).*zzz);
        dp(:,:,1)=dp(:,:,1)-2./(v(it).*yyy+w(it).*zzz).*mult;
        dp(:,:,2)=dp(:,:,2)-(y(it)-xxx-u(it))*v(it)./(v(it).*yyy+w(it).*zzz).^2.*mult;
        dp(:,:,3)=dp(:,:,3)-(y(it)-xxx-u(it))*w(it)./(v(it).*yyy+w(it).*zzz).^2.*mult;
    end
end
end