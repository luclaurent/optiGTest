%% Mishra 7 function
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
%global minimum : f(x)=0 for xi=sqrt(n)
%
%Design space: -10<xi<10


function [p,dp]=funMishra07(xx)

%evaluation and derivatives
dim=size(xx,3);
pa=xx-factorial(dim);
pb=prod(pa,3);
%
p=pb.^2;

if nargout==2    
    funP=@(i)prod(xx(:,:,[1:i-1 i+1:end]),3);
    pc=arrayfun(funP,1:dim,'UniformOutput',false);
    pc=cell2mat(reshape(pc,1,1,dim));
    %
    dp=2*pc.*pb;%2*bsxfun(@times,pc,pb);
end
end
