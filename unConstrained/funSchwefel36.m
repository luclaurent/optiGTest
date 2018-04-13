%% Schwefel 36 function
%L. LAURENT -- 28/04/2017 -- luc.laurent@lecnam.net

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
%numerous local minima
%1 global minimum : x=(12,12) >> f(x)=-3456
%
%Design space: 0<xi<10

function [p,dp]=funSchwefel36(xx)

%constants
a=72;
b=2;

%evaluation and derivatives
xxx=xx(:,:,1);
yyy=xx(:,:,2);
%
pa=xxx.*yyy;
pb=a-b*xxx-b*yyy;
%
p=-pa.*pb;
%
if nargout==2
    %
    dp=zeros(size(xx));
    %
    dp(:,:,1)=-yyy.*pb+b*pa;
    dp(:,:,2)=-xxx.*pb+b*pa;
end

end
