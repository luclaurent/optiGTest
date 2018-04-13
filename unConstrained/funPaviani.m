%% Paviani function
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
% global minimum : f(x)=-45.778 for x=[9.351,...,9.351]
%
%Design space: 2.0001<xi<10


function [p,dp]=funPaviani(xx)

%constants
a=2;
b=10;
c=0.2;

%evaluation and derivatives
dim=size(xx,3);
xa=xx-a;
xb=b-xx;
la=log(xa);
lb=log(xb);
%
pa=sum(la.^2+lb.^2,3);
pb=prod(xx,3);
p=pa-pb.^c;

if nargout==2
    funP=@(i)prod(xx(:,:,[1:i-1 i+1:end]),3);
    pd=arrayfun(funP,1:dim,'UniformOutput',false);
    pd=cell2mat(reshape(pd,1,1,dim));
    %
    dp=2*la./xa-2*lb./xb-c*bsxfun(@times,pb.^(c-1),pd);
end
end
