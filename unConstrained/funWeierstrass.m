%% Weierstrass function
% L. LAURENT -- 28/02/2017 -- luc.laurent@lecnam.net

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
%Design space -1/2<xi<1/2

function [p,dp] = funWeierstrass(xx)

%constants
a=1/2;
b=3;
k=20;
c=2*pi;
d=1/2;
e=pi;
nbvar=size(xx,3);

%evaluation and derivatives
lik=reshape(0:k,1,1,1,[]);
%
pa=a.^lik.*cos(c*b.^lik.*(xx+d));
pb=a.^lik.*cos(e*b.^lik);
%
pAA=sum(pa,4);
pBB=sum(pb,4);
%
p=sum(pAA,3)-nbvar*pBB;

pp=zeros(size(xx,1),size(xx,2));
for itD=1:nbvar
    for itk=0:k
        pp=pp+a.^itk.*cos(c*b.^itk.*(xx(:,:,itD)-d));
    end
end
for itk=0:k
        pp=pp-nbvar*a.^itk.*cos(e*b.^itk);
end

%keyboard

if nargout==2
    dpd=zeros(size(xx));
    for itk=0:k
        dpd=dpd-a.^itk.*c.*b^itk.*sin(c*b.^itk.*(xx+d));
    end
    dp=sum(-a.^lik.*b.^lik.*c.*sin(c*b.^lik.*(xx+d)),4); 
    %keyboard
end
end

