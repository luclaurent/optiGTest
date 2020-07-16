%% Step 1 function
% L. LAURENT -- 28/04/2017 -- luc.laurent@lecnam.net

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
%global minimum : f(xi)=0 pour (x1,x2,x3,x4)=(0,...,0)
%Design space: -5<xi<5


function [p,dp] = funStep1(xx)


%evaluation and derivatives
pa=floor(abs(xx));
%
p=sum(pa,3);

if nargout==2
    %function for testinf integer
    fun=@(input) (imag(input) == 0) & (round(input) == input);
    isInt=fun(xx);
    %    
    dp=zeros(size(xx));
    dp(isInt)=1/eps;
end
end
