%% Bartels Conn's function
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
%1 global minimum : x=(0,0) >> f(x)=1
%
%design space -500<xi<500



function [p,dp]=funBartelsConn(xx)

%responses and derivatives
xxx=xx(:,:,1);
yyy=xx(:,:,2);

fa=xxx.^2+yyy.^2+xxx.*yyy;
fb=sin(xxx);
fc=cos(yyy);
p=abs(fa)+abs(fb)+abs(fc);

if nargout==2
    dp(:,:,1)=sign(fa).*(2*xxx+yyy)+sign(fb).*(cos(xxx));
    dp(:,:,2)=sign(fa).*(2*yyy+xxx)+sign(fc).*(-sin(yyy));
end
end