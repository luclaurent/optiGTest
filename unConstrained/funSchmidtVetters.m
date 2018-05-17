%% Schmidt-Vetters's function
% L. LAURENT -- 19/02/2017 -- luc.laurent@lecnam.net

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

%1 minimum global: f(0.78547,0.78547,0.78547)=2.99845
%
%Design space 0<xi<10 (other minima outside of this space)


function [p,dp] = funSchmidtVetters(xx)

%constants
a=1;
b=pi;
c=2;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
z=xx(:,:,3);
%
pa=a+(x-y).^2;
ga=a./pa;
pb=(b*y+z)./c;
gb=sin(pb);
pc=((x+y)./y-c);
gc=exp(pc.^2);
%
p=ga+gb+gc;

if nargout==2
    %
    ax=-2*a*(x-y)./pa.^2;
    ay=-ax;
    by=b/c*cos(pb);
    bz=1/c*cos(pb);
    cx=2./y.*pc.*gc;
    cy=-2*x./y.^2.*pc.*gc;
    %
    dp=zeros(size(xx));
    dp(:,:,1)=ax+cx;
    dp(:,:,2)=ay+by+cy;
    dp(:,:,3)=bz;
end
end
