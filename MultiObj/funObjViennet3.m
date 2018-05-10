%% Viennet 3rd objective function
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

function [p,dp]=funObjViennet3(xx)

%constant
a=1.1;

%responses and derivatives
xxx=xx(:,:,1);
yyy=xx(:,:,2);
%
td=xxx.^2+yyy.^2;
tda=1./(td+1);
tdb=exp(-td);
%
p=tda.*tdb;

if nargout==2
    %
    tdx=2*xxx;
    tdy=2*yyy;
    %
    tdax=-tdx.*tda.^2;
    tday=-tdy.*tda.^2;
    %
    tdbx=-tdx.*tdb;
    tdby=-tdy.*tdb;
    %
    dp(:,:,1)=tdax.*tdb+tda.*tdbx;
    dp(:,:,2)=tday.*tdb+tda.*tdby;
    %
end
end
