%% Mishra 8 function
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
%global minimum : f(x)=0 for x=(2,-3)
%
%Design space: -10<xi<10


function [p,dp]=funMishra08(xx)

%constants
aa=0.001;
a=[1,-20,180,-960,3360,-8064,1334,-15360,11520,-5120,2624];
b=[1,12,54,108,81];

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
itg=reshape(10:-1:0,1,1,11);
gt=bsxfun(@power,xxx,itg);
g=bsxfun(@times,gt,reshape(a(11-itg),1,1,11));
ith=reshape(4:-1:0,1,1,5);
ht=bsxfun(@power,yyy,ith);
h=bsxfun(@times,ht,reshape(b(5-ith),1,1,5));
%
pa=abs(sum(h,3)).*abs(sum(g,3));
p=aa*pa.^2;

if nargout==2
    itdg=reshape(10:-1:1,1,1,10);
    dgt=bsxfun(@power,xxx,itdg-1);    
    dgtt=bsxfun(@times,dgt,itdg);
    dg=bsxfun(@times,dgtt,reshape(a(11-itdg),1,1,10));
    itdh=reshape(4:-1:1,1,1,4);
    dht=bsxfun(@power,yyy,itdh-1);
    dhtt=bsxfun(@times,dht,itdh);
    dh=bsxfun(@times,dhtt,reshape(b(5-itdh),1,1,4));
    %
    dp(:,:,1)=2*aa*sign(sum(g,3)).*abs(sum(h,3)).*sum(dg,3).*pa;
    dp(:,:,2)=2*aa*sign(sum(h,3)).*abs(sum(g,3)).*sum(dh,3).*pa;
end
end
