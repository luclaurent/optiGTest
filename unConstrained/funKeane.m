%% Keane's function
%L. LAURENT -- 17/11/2016 -- luc.laurent@lecnam.net

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
%global minimum : f(x1,x2)=-0.673668 for (x1,x2)={(0,1.39325),(1.39325,0)}
%
%Design space: 0<xi<10


function [p,dp]=funKeane(xx)

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
sa=sin(xxx-yyy);
sb=sin(xxx+yyy);
pa=sqrt(xxx.^2+yyy.^2);
%
p=sa.^2.*sb.^2./pa;

if nargout==2
    ca=cos(xxx-yyy);
    cb=cos(xxx+yyy);
    %
    dp(:,:,1)=(2*sa.*ca.*sb.^2+2*sb.*cb.*sa.^2)./pa-xxx.*p./pa.^2;
    dp(:,:,2)=(-2*sa.*ca.*sb.^2+2*sb.*cb.*sa.^2)./pa-yyy.*p./pa.^2;
end
end
