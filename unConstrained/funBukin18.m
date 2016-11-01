%% Bukin 18's function
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

function [p,dp]=funBukin18(xx)

%constants
a=1000;
b=15;
c=80;
d=21;
e=100;
f=17;
g=90;


%evaluation and derivatives
pa=xx(:,:,2)+b*xx(:,:,1)+c;
pb=xx(:,:,2)-d*xx(:,:,1)-e;
pc=e*xx(:,:,1)+xx(:,:,2)-e;
pd=f*xx(:,:,1)+xx(:,:,2)+g;
p=a*abs(pa.*pb.*pc)+abs(pd);
if nargout==2
    dp(:,:,1)=a*(b*pb.*pc-d*pa.*pc+e*pa.*pb).*sign(pa.*pb.*pc)+sign(pd);
    dp(:,:,2)=a*(pb.*pc+pa.*pc+pa.*pb).*sign(pa.*pb.*pc)+sign(pd);   
end
end

