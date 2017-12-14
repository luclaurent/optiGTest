%% Schwefel 25 function
%L. LAURENT -- 28/04/2017 -- luc.laurent@lecnam.net
%

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

%numerous local minima
%1 global minimum : x=(1,1,...,1) >> f(x)=0
%
%Design space: 0<xi<10

function [p,dp]=funSchwefel25(xx)

%constants
a=1;

%evaluation and derivatives
pa=xx-a;
pb=bsxfun(@minus,xx(:,:,1),xx.^2);
%
p=sum(pa.^2+pb.^2,3);
%
if nargout==2
    %
    dp=2*pa-4*xx.*pb;
    %
    dp(:,:,1)=dp(:,:,1)+sum(2*pb,3);
end

end
