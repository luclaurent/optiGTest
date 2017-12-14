%% Hartmann 3 function
%L. LAURENT -- 16/11/2016 -- luc.laurent@lecnam.net

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
%global minimum : f(x1,x2)=-3.86278214782076 for (x1,x2)=[0.114614,0.555649,0.852547]
%
%Design space: 0<xi<10


function [p,dp]=funHartmann3(xx)
%constants
ma=[3.0,  0.1,  3.0,  0.1;
    10.0, 10.0, 10.0, 10.0;
    30.0, 35.0, 30.0, 35.0];
mp=[0.36890, 0.46990, 0.10910, 0.03815;
    0.11700, 0.43870, 0.87320, 0.57430;
    0.26730, 0.74700, 0.55470, 0.88280];
c=[1,1.2,3,3.2];
b=4;
dim=3;

%evaluation and derivatives
sX=size(xx);
p=zeros(sX(1),sX(2));
for it=1:b
    pa=bsxfun(@minus,xx,reshape(mp(:,it),1,1,dim));    
    pb=bsxfun(@times,reshape(ma(:,it),1,1,dim),pa.^2);
    p=p-c(it)*exp(-sum(pb,3));
end

if nargout==2
    dp=zeros(sX);
    %
    for it=1:b
        pa=bsxfun(@minus,xx,reshape(mp(:,it),1,1,dim));
        pb=bsxfun(@times,reshape(ma(:,it),1,1,dim),pa.^2);
        pc=exp(-sum(pb,3));
        pe=bsxfun(@times,reshape(ma(:,it),1,1,dim),pa);
        %
        for itD=1:dim
            dp(:,:,itD)=dp(:,:,itD)+2*c(it)*pe(:,:,itD).*pc;
        end
    end
end
end
