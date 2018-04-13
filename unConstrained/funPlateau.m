%% Plateau function
%L. LAURENT -- 23/03/2017 -- luc.laurent@lecnam.net

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
%global minimum : f(x)=30 for xi=0
%
%Design space: -5.12<xi<5.12
%

function [p,dp]=funPlateau(xx)
%constants
a=30;

%evaluation and derivatives
pa=floor(abs(xx));
%
p=a+sum(pa,3);
%
if nargout==2
    %
    dp=zeros(size(xx));
    %
    isInteger =@(input) (imag(input) == 0) & (round(input) == input);
    %
    siX=sign(xx);
    %
    isInt=isInteger(xx);
    %
    dp(isInt)=1/eps*siX(isInt);
end