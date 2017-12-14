%% Penalty 2 function
%L. LAURENT -- 21/03/2017 -- luc.laurent@lecnam.net

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
%global minimum : f(x)=0 for xi=-1
%
%Design space: -50<xi<50
%



function [p,dp]=funPenalty2(xx)
%constants
a=0.1;
b=3*pi;
c=1;
d=2*pi;
e=5;
f=100;
g=4;

%evaluation and derivatives
%
pa=sin(b*xx(:,:,1));
pb=xx(:,:,1:end-1)-c;
sc=sin(b*xx(:,:,2:end));
pc=c+sc.^2;
pd=xx(:,:,end)-c;
se=sin(d*xx(:,:,end));
pe=c+se.^2;
%
u=zeros(size(xx));
IXb=abs(xx)>e;
u(IXb)=f*(abs(xx(IXb))-e).^g;
%
p=a*(pa.^2+sum(pb.^2.*pc,3)+pd.^2.*pe)+sum(u,3);
%p=a*sum(pb.^2.*pc,3);
%keyboard
%
if nargout==2
    %
    dp=zeros(size(xx));
    %
    du=zeros(size(xx));
    du(IXb)=f*e*sign(xx(IXb)).*(abs(xx(IXb))-b).^(f-1);
    %
    ppa=cos(b*xx(:,:,1));
    cc=cos(b*xx(:,:,2:end));
    ce=cos(d*xx(:,:,end));
    %
    dp(:,:,1)=2*a*b.*pa.*ppa...
        +2*a*pb(:,:,1).*pc(:,:,1)...
        +du(:,:,1);
    dp(:,:,end)=2*a*b.*sc(:,:,end).*cc(:,:,end).*pb(:,:,end).^2 ...
        +2*a*pd.*pe...
        +2*d*a*ce.*se.*pd.^2 ...
        +du(:,:,end);
    dp(:,:,2:end-1)=2*a*b*sc(:,:,1:end-1).*cc(:,:,1:end-1).*pb(:,:,1:end-1).^2 ...
        +2*a*pb(:,:,2:end).*pc(:,:,2:end)...
        +du(:,:,2:end-1);
end