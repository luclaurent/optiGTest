%% Jennrich-Sampson's function
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
%global minimum : f(x1,x2)=124.3622 for (x1,x2)=(0.257825,0.257825)
%
%Design space: -1<xi<1


function [p,dp]=funJennrichSampson(xx)
%constants
a=2;
b=10;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
ii=reshape(1:b,1,1,b);
ex=bsxfun(@power,exp(xxx),ii);
ey=bsxfun(@power,exp(yyy),ii);
se=bsxfun(@minus,a*ii,ex+ey);
%
p=sum((a+se).^2,3);

if nargout==2
    iex=bsxfun(@times,ii,ex);
    iey=bsxfun(@times,ii,ey);
    %
    dp(:,:,1)=sum(-iex*2.*(a+se),3);
    dp(:,:,2)=sum(-iey*2.*(a+se),3);
end
end
