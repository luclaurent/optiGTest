%% Cigar function 
%L. LAURENT -- 14/03/2017 -- luc.laurent@lecnam.net

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
%global minimum : f(x)=-24.15681551650653 for xi=+/- 9.646157266348881
%
%Design space: -10<xi<10


function [p,dp]=funCigar(xx)
%constants
a=1e6;

%evaluation and derivatives
x=xx(:,:,1);
%
pa=sum(xx.^2,3);
%
p=x.^2+a*pa;

if nargout==2
    %
    dp=zeros(size(xx));
    %
    dp(:,:,1)=2*x+2*a*x;
    dp(:,:,2:end)=2*a*xx(:,:,2:end);
end
end
