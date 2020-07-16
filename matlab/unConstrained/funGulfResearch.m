%% Gulf Research function
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
%global minimum : f(x1,x2)=0 for (50,25,1.5)
%
%Design space: 0<xi<60

%similar to Weibull function

function [p,dp]=funGulfResearch(xx)

%constants
a=99;
b=25;
c=-50;
d=1/1.5;
f=0.01;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
z=xx(:,:,3);
%
listI=reshape(1:a,1,1,a);
%
zi=f*listI;
yi=b+(c*log(1./zi)).^d;
%
pa=yi-z;
pb=pa.^y./x;
pc=exp(-pb);
pd=pc-zi;
%
p=sum(pd.^2,3);

%
if nargout==2
    %
    dp=zeros(size(xx));
    %
    dp(:,:,1)=2*sum(pb./x.*pc.*pd,3);
    dp(:,:,2)=2*sum(-log(pa)./x.*pb.*pc.*pd,3);
    dp(:,:,3)=2*sum(pa.^(y-1)./x.*y.*pc.*pd,3);
end
end