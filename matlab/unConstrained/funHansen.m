%% Hansen function
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
%global minimum : f(x1,x2)=-176.5418 for 
%   (x1,x2)={(-7.589893, -7.708314), (-7.589893, -1.425128),
%   (-7.589893, 4.858057), (-1.306708, -7.708314),
%   (-1.306708, 4.858057), ( 4.976478, 4.858057),
%   ( 4.976478, -1.425128), ( 4.976478, -7.708314)}
%
%Design space: -10<xi<10


function [p,dp]=funHansen(xx)
%constants
a=4;
b=1;
c=2;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
ii=reshape(0:a,1,1,a+1);
pa=bsxfun(@times,ii,xxx);
pb=bsxfun(@plus,ii,pa);
pc=bsxfun(@times,(ii+c),yyy);
pd=bsxfun(@plus,ii,pc);
pe=bsxfun(@times,(ii+b),cos(pb+b));
pf=bsxfun(@times,(ii+b),cos(pd+b));
%
pta=sum(pe,3);
ptb=sum(pf,3);
p=pta.*ptb;

if nargout==2
    pg=bsxfun(@times,ii.*(ii+b),sin(pb+b));
    ph=bsxfun(@times,(ii+c).*(ii+b),sin(pd+b));
    %
    dp(:,:,1)=-sum(pg,3).*ptb;
    dp(:,:,2)=-sum(ph,3).*pta;   
end
end
