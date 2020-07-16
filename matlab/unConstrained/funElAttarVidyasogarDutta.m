%% El-Attar-Vidyasogar-Dutta's function
%L. LAURENT -- 15/11/2016 -- luc.laurent@lecnam.net

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
%global minimum : f(x1,x2)=1.712780354 for (3.40918683, -2.17143304)
%
%Design space: -500<xi<500


function [p,dp]=funElAttarVidyasogarDutta(xx)

%constants
a=10;
b=7;
c=1;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
pa=xxx.^2+yyy-a;
pb=xxx+yyy.^2-b;
pc=xxx.^2+yyy.^3-c;
p=pa.^2+pb.^2+pc.^2;
%
if nargout==2
    dp(:,:,1)=4*xxx.*pa+2*pb+4*xxx.*pc;
    dp(:,:,2)=2*pa+4*yyy.*pb+6*yyy.^2.*pc;
end
end