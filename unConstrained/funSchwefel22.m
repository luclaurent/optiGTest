%% Schwefel 22 function
% L. LAURENT -- 19/02/2017 -- luc.laurent@lecnam.net

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
%Design space -100<xi<100


function [p,dp] = funSchwefel22(xx)

dim=size(xx,3);

%evaluation and derivatives
pa=abs(xx);
%
p=sum(pa,3)+prod(pa,3);


if nargout==2
    %
    funP=@(i)prod(pa(:,:,[1:i-1 i+1:end]),3);
    pd=arrayfun(funP,1:dim,'UniformOutput',false);
    pd=cell2mat(reshape(pd,1,1,dim));
    %
    dp=sign(xx).*(1+pd);
    
    %sx=sign(xx);
    
    %
    %dp=2/dim.*bsxfun(@times,sx,pc).*(1-bsxfun(@times,pd,pb.^(1/dim-1)));
end
end
