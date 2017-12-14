%% Price 3 function
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
%global minimum : f(x)=0 for x=(1,1)
%
%Design space: -500<xi<500


function [p,dp]=funPrice3(xx)

%constants
a=100;
b=6;
c=6.4;
d=0.6;
e=0.5;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
pa=yyy-xxx.^2;
pb=c*(yyy-e).^2-xxx-d;
%
p=a.*pa.^2+b*pb.^2;

if nargout==2
    dp(:,:,1)=-4*a*xxx.*pa-2*b*pb;
    dp(:,:,2)=2*a*pa+4*b*c*(yyy-e).*pb;
end
end
