%% Griewank function
%L. LAURENT -- 16/11/2016 -- luc.laurent@lecnam.net

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
%global minimum : f(x1,x2)=0 for (0,...,0)
%
%Design space: -100<xi<100

function [p,dp]=funGriewank(xx)

%constants
a=1/4000;
b=1;

%evaluation and derivatives
dim=size(xx,3);
div=sqrt(reshape(1:dim,1,1,dim));
pa=bsxfun(@times,xx,1./div);
p=a*sum(xx.^2,3)-prod(cos(pa),3)+b;
%
if nargout==2
    funP=@(i)prod(cos(pa(:,:,[1:i-1 i+1:end])),3);
    pb=arrayfun(funP,1:dim,'UniformOutput',false);
    pb=cell2mat(reshape(pb,1,1,dim));
    %
    dp=2*a*xx...
        +bsxfun(@times,sin(pa),1./div).*pb;
end
end