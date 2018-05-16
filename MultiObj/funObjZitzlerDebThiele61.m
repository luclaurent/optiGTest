%% Zitzler-Deb-Thiele N6 1st objective function
%L. LAURENT -- 09/05/2018 -- luc.laurent@lecnam.net

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

function [p,dp]=funObjZitzlerDebThiele61(xx)

%constants
a=4;
b=6*pi;

%responses and derivatives
xxx=xx(:,:,1);
%
tda=exp(-a*xxx);
sb=sin(b*xxx);
tdb=sb.^6;
%
p=1-tda.*tdb;

if nargout==2
    %
    dtda=-a*tda;
    dtdb=6*b*cos(b*xxx).*sb.^5;
    %
    dp=zeros(size(xx));
    dp(:,:,1)=-dtda.*tdb-tda.*dtdb;
end
end
