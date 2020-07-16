%% Needle Eye function
%L. LAURENT -- 20/03/2017 -- luc.laurent@lecnam.net

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
%global minimum : f(x)=1 for xi=-1
%
%Design space: -10<xi<10
%


function [p,dp]=funNeedleEye(xx)
%constants
a=100;
b=1e-4;


%evaluation and derivatives
aX=abs(xx);
%
pa=a+aX;
%
IXa=aX<b;
IXb=aX>b;
IXAll=all(IXa,3);
%
p=sum(pa.*IXb,3);
p(IXAll)=1;

%
if nargout==2
    %
    dp=zeros(size(xx));
    %
    dp=sign(xx).*IXb;
    dp(IXAll(:,:,ones(1,size(xx,3))))=0;
    
end
