%% Mishra 2 function
%L. LAURENT -- 17/11/2016 -- luc.laurent@lecnam.net

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
%global minimum : f(x)=2 for x=?
%
%Design space: 0<xi<1


function [p,dp]=funMishra02(xx)
%constants
a=1;
b=0.5;

%evaluation and derivatives
dim=size(xx,3);
xn=dim-b*sum(xx,3);
%
p=(a+xn).^xn;

if nargout==2
    dp=bsxfun(@times,(log(a+xn)+xn./(a+xn)).*p,-b*ones(1,1,dim));
end
end
