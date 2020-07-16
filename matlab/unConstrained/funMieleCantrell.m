%% Miele Cantrell's function
%L. LAURENT -- 17/11/2016 -- luc.laurent@lecnam.net

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
%global minimum : f(x1,x2,x3,x4)=0 for (x1,x2,x3,x4)=(0,1,1,1)
%
%Design space: -1<xi<1


function [p,dp]=funMieleCantrell(xx)
%constants
a=100;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);
zzz=xx(:,:,3);
uuu=xx(:,:,4);

%evaluation and derivatives
pa=exp(-xxx)-yyy;
pb=yyy-zzz;
pc=zzz-uuu;
%
p=pa.^4+a*pb.^6+tan(pc).^4+xxx.^8;

if nargout==2
    dp(:,:,1)=-4*exp(-xxx).*pa.^3+8*xxx.^7;
    dp(:,:,2)=-4*pa.^3+6*a*pb.^5;
    dp(:,:,3)=-6*a*pb.^5+4*(1+tan(pc).^2).*tan(pc).^3;
    dp(:,:,4)=-4*(1+tan(pc).^2).*tan(pc).^3;
end
end
