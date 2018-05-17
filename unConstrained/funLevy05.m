%% Levy 05 function
%L. LAURENT -- 17/03/2017 -- luc.laurent@lecnam.net

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
%global minimum : f(x)=-176.1375 for x=[-1.3068 -1.4248]
%
%Design space: -10<xi<10
%


function [p,dp]=funLevy05(xx)
%constants
m=5;
a=1.42513;
b=0.80032;


%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
%
lI=reshape(1:m,1,1,m);
%
pa=cos((lI-1).*x+lI);
pb=cos((lI+1).*y+lI);
pc=x+a;
pd=y+b;
%
p=sum(lI.*pa,3).*sum(lI.*pb,3)+pc.^2+pd.^2;

%
if nargout==2
    %
    dp=zeros(size(xx));
    %
    dp(:,:,1)=sum(-lI.*(lI-1).*sin((lI-1).*x+lI),3).*sum(lI.*pb,3)+2*pc;
    dp(:,:,2)=sum(-lI.*(lI+1).*sin((lI+1).*y+lI),3).*sum(lI.*pa,3)+2*pd;
end
end
