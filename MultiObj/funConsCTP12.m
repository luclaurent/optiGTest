%% CTP1 2nd constraint function
%L. LAURENT -- 09/05/2018 -- luc.laurent@lecnam.net

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

function [p,dp]=funConsCTP12(xx)

%constants
a=0.728;
b=0.295;

%responses and derivatives
if nargout==2
    [f1,df1]=funObjCTP11(xx);
    [f2,df2]=funObjCTP12(xx);
else
    f1=funObjCTP11(xx);
    f2=funObjCTP12(xx);
end
%
td=a*exp(-b*f1);
p=f2./td;

if nargout==2
    %
    dp=(df2+b*f2.*df1)./td;
end
end
