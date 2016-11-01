%% Bukin 7's function
%L. LAURENT -- 01/11/2016 -- luc.laurent@lecnam.net
%

%     GRENAT - GRadient ENhanced Approximation Toolbox
%     A toolbox for generating and exploiting gradient-enhanced surrogate models
%     Copyright (C) 2016  Luc LAURENT <luc.laurent@lecnam.net>
%
%     This program is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
%
%     This program is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
%
%     You should have received a copy of the GNU General Public License
%     along with this program.  If not, see <http://www.gnu.org/licenses/>.

function [p,dp]=funBukin7(xx)

%constants
a=100;
b=25;
c=5;
d=exp(5);

%evaluation and derivatives
pa=b+xx(:,:,1).*xx(:,:,2);
spa=sqrt(abs(pa));
pb=xx(:,:,1)+exp(xx(:,:,2))-d+c;
spb=sqrt(abs(pb));
p=a*spa+a*spb;
if nargout==2
    dp(:,:,1)=a*sign(pa).*xx(:,:,2)./(2*spa)+a*sign(pb)./(2*spb);
    dp(:,:,2)=a*sign(pa).*xx(:,:,1)./(2*spa)+a*sign(pb).*exp(xx(:,:,2))./(2*spb);   
end
end
