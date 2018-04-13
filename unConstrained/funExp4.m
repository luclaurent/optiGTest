%% Exp4 function
%L. LAURENT -- 26/04/2017 -- luc.laurent@lecnam.net

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
%global minimum : f(x)=0 for x=[1 10 1 5]
%
%Design space: 0<xi<20
%



function [p,dp]=funExp4(xx)
%constants
a=10;
b=5;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
z=xx(:,:,3);
v=xx(:,:,4);
%
listI=reshape(1:a,1,1,a);
pa=exp(-listI.*x./a);
pb=-exp(-listI.*y./a);
pc=-exp(-listI./a);
pd=b*exp(-listI);
%
pt=z.*pa+v.*pb+pc+pd;
p=sum(pt.^2,3);

%
if nargout==2
    %
    dp=zeros(size(xx));
    %
    dp(:,:,1)=2*z.*sum(-listI./a.*pa.*pt,3);
    dp(:,:,2)=2*v.*sum(-listI/a.*pb.*pt,3);
    dp(:,:,3)=2*sum(pa.*pt,3);
    dp(:,:,4)=2*sum(pb.*pt,3);
end
end
