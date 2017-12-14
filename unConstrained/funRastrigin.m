%% Rastrigin function
%L. LAURENT -- 21/02/2012 -- luc.laurent@lecnam.net

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
%1 minimum global: x=(0,0,...,0) >> f(x)=0
%
%Design space -5.12<xi<5.12
%
%[TZ89] A. T\¨orn and A. Zilinskas. "Global Optimization". Lecture Notes in Computer Science, No 350, Springer-Verlag, Berlin,1989.
%[MSB91] H. M\¨uhlenbein, D. Schomisch and J. Born. "The Parallel Genetic Algorithm as Function Optimizer ". Parallel Computing, 17, pages 619-632,1991.


function [p,dp]=funRastrigin(xx)

%constants
coef=10;
nbvar=size(xx,3);

%evaluation and derivatives
cal=xx.^2-coef*cos(2*pi*xx);
p=coef*nbvar+sum(cal,3);

if nargout==2
    dp=2*xx+2*coef*pi*sin(2*pi*xx);
end
end