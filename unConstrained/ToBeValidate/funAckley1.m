%% Ackley's function 1
%L. LAURENT -- 31/10/2016 -- luc.laurent@lecnam.net

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
%numerous local minima
%1 global minimum : x=(0,0,...,0) >> f(x)=0
%
%design space -35<xi<35 (small range -2<xi<2)

function [p,dp]=funAckley1(xx)

%constants
a=20;
b=0.02;
c=2*pi;
d=exp(1);

%number of variables
nbvar=size(xx,2);

%responses and derivatives
normP=sqrt(sum(xx.^2,3));
ex1=exp(-b*normP/sqrt(nbvar));
sco=sum(cos(c*xx),3);
ex2=exp(1/nbvar*sco);
p=-a*ex1-ex2+a+d;

if nargout==2
    dp=a*b*1/sqrt(nbvar)*xx./normP.*ex1+c/nbvar*sin(c*xx).*ex2;
end
end