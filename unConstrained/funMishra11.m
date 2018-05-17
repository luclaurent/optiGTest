%% Mishra 11 function
%L. LAURENT -- 17/11/2016 -- luc.laurent@lecnam.net

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
%global minimum : f(x)=0 for xi=0
%
%Design space: -10<xi<10


function [p,dp]=funMishra11(xx)

%evaluation and derivatives
dim=size(xx,3);
pa=sum(abs(xx),3);
pb=prod(abs(xx),3);
%
pc=1/dim*pa-(pb).^(1/dim);
p=pc.^2;

if nargout==2    
    sx=sign(xx);
    funP=@(i)prod(abs(xx(:,:,[1:i-1 i+1:end])),3);
    pd=arrayfun(funP,1:dim,'UniformOutput',false);
    pd=cell2mat(reshape(pd,1,1,dim));
    %
    dp=2/dim.*bsxfun(@times,sx,pc).*(1-bsxfun(@times,pd,pb.^(1/dim-1)));
end
end
