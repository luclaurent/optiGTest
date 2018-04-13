%% Katsuura function
%L. LAURENT -- 17/03/2017 -- luc.laurent@lecnam.net

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
%global minimum : f(x)=1 for xi=0
%
%Design space: 0<xi<100
%



function [p,dp]=funKatsuura(xx)
%constants
d=32;

%evaluation and derivatives
sX=size(xx,3);
%
lD=reshape(1:d,1,1,1,d);
lI=reshape(1:sX,1,1,sX);
%
pa=2.^lD.*xx;
pbf=floor(pa).*2.^lD;
%
spb=sum(pbf,4);
pt=1+lI.*spb;
%
p=prod(pt,3);

%
if nargout==2
    %
    dp=zeros(size(xx));
    %
    isInteger =@(input) (imag(input) == 0) & (round(input) == input);
    %
    dp(isInteger(xx))=1/eps;
end
end
