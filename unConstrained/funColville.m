%% Colville function
%L. LAURENT -- 16/09/2011 -- luc.laurent@lecnam.net

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
%global minimum : f(x1,x2,x3,x4)=0 for (x1,x2,x3,x4)=(1,1,1,1)
%
%Design space: -10<xi<10


function [p,dp]=funColville(xx)

%constants
a=100;
b=1;
c=90;
d=10.1;
e=19.8;

%evaluation and derivatives
pa=xx(:,:,1)-xx(:,:,2).^2;
pb=b-xx(:,:,1);
pc=xx(:,:,4)-xx(:,:,3).^2;
pd=b-xx(:,:,3);
pe=xx(:,:,2)-b;
pf=xx(:,:,4)-b;
%
p=a*pa.^2+pb.^2+c*pc.^2+pd.^2+d*pe.^2+d*pf.^2+e*pe.*pf;
%
if nargout==2
    dp(:,:,1)=2*a*pa-2*pb;
    dp(:,:,2)=-4*a*xx(:,:,2).*pa+2*d*pe+e*pf;
    dp(:,:,3)=-4*c*xx(:,:,3).*pc-2*pd;
    dp(:,:,4)=2*c*pc+2*d*pf+e*pe;
end
end