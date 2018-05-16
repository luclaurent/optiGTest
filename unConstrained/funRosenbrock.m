%% Rosenbrock function
% L. LAURENT -- 12/05/2010 -- luc.laurent@lecnam.net

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

%1 minimum global: f(1,...,1)=0
%
%Design space -30<xi<30

function [p,dp] = funRosenbrock(xx)

%constants
a=100;
b=1;

%evaluation and derivatives
pa=xx(:,:,2:end)-xx(:,:,1:end-1).^2;
pb=xx(:,:,1:end-1)-b;
cal=a*pa.^2+pb.^2;
%
p=sum(cal,3);

if nargout==2
    dgi=-4*a*pa.*xx(:,:,1:end-1)...
        +2*pb;
    %
    dp=zeros(size(xx)); 
    dp(:,:,1)=dgi(:,:,1);
    dp(:,:,2:end-1)=dgi(:,:,2:end)+2*a*pa(:,:,1:end-1);
    dp(:,:,end)=2*a*pa(:,:,end);
end
end
