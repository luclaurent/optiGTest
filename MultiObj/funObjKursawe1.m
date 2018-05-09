%% Kursawe 1st objective function
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

function [p,dp]=funObjKursawe1(xx)

%constants
a=10;
b=0.2;

%responses and derivatives
xxx=xx(:,:,1);
yyy=xx(:,:,2);
zzz=xx(:,:,3);
%
tda=xxx.^2+yyy.^2;
tdb=yyy.^2+zzz.^2;
%
sa=sqrt(tda);
sb=sqrt(tdb);
%
etda=-a*exp(-b*sa);
etdb=-a*exp(-b*sb);
%
p=etda+etdb;

if nargout==2
    %
    dp(:,:,1)=-b*etda.*xxx./sa;
    dp(:,:,2)=-b*etda.*yyy./sa-b*etdb.*yyy./sb;
    dp(:,:,3)=-b*etdb.*zzz./sb;
end
end
