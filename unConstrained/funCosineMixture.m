%% Cosine Mixture function
%L. LAURENT -- 04/11/2016 -- luc.laurent@lecnam.net
%
%numerous local minima
%1 global minimum : x=(0,0,...,0) >> f(x)=0
%
%design space -1<xi<1

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

function [p,dp]=funCosineMixture(xx)

%constants
a=0.1;
b=5*pi;

%evaluation and derivatives
pa=cos(b*xx);
pb=xx.^2;
p=a*sum(pa,3)+sum(pb,3);
if nargout==2
    dp=-a*b*sin(b*xx)+2*xx;
end
end