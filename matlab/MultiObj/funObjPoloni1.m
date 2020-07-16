%% Ploloni 1st objective function
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

function [p,dp]=funObjPoloni1(xx)

%constants
a=0.5;
b=2;
c=1.5;
%
A1=a*sin(1)-b*cos(1)+sin(b)-c*cos(b);
A2=c*sin(1)-cos(1)+b*sin(b)-a*cos(b);

%responses and derivatives
xxx=xx(:,:,1);
yyy=xx(:,:,2);
%
sx=sin(xxx);
sy=sin(yyy);
cx=cos(xxx);
cy=cos(yyy);
%
B1=a*sx-b*cx+sy-c*cy;
B2=c*sx-cx+b*sy-a*cy;
%
tda=A1-B1;
tdb=A2-B2;
%
p=1+tda.^2+tdb.^2;

if nargout==2
    %
    B1x=a*cx+b*sx;
    B1y=cy+c*sy;
    B2x=c*cx+sx;
    B2y=b*cy+a*sy;    
    %
    dp(:,:,1)=-2*B1x.*tda-2*B2x.*tdb;
    dp(:,:,2)=-2*B1y.*tda-2*B2y.*tdb;
end
end
