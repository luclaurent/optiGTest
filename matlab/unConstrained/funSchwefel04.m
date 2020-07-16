%% Schwefel 4 function
% L. LAURENT -- 19/02/2017 -- luc.laurent@lecnam.net

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

%1 minimum global: f(0,...,0)=0
%
%Design space 0<xi<10


function [p,dp] = funSchwefel04(xx)

%constants
a=1;

%evaluation and derivatives
x1=xx(:,:,1);
pa=xx-a;
pb=x1-xx.^2;
%
p=sum(pa.^2+pb.^2,3);

if nargout==2
    %
    dp=zeros(size(xx));
    %
    dp(:,:,1)=2*(x1-a) ...
        + 2*(1-2*x1).*(x1-x1.^2) ...
        + 2*sum(pb(:,:,2:end),3);
    dp(:,:,2:end)=2*pa(:,:,2:end) ...
        - 4*xx(:,:,2:end).*pb(:,:,2:end);
end
end
