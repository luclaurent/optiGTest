%% Yao-Liu 9 function
% L. LAURENT -- 28/02/2017 -- luc.laurent@lecnam.net

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

%1 minimum global: f(0,...,0)=0
%
%Design space -5.12<xi<5.12

function [p,dp] = funYaoLiu9(xx)

%constants
a=10;
b=2*pi;

%evaluation and derivatives
pa=xx.^2-a*cos(b*xx)+a;
%
p=sum(pa,3);

if nargout==2   
    dp=2*xx+a*b*sin(b*xx);
end
end

