%% Mishra 3 function
%L. LAURENT -- 17/11/2016 -- luc.laurent@lecnam.net

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

%
%global minimum : f(x)=-0.18467 for x=(-8.4667,-10)
%
%Design space: -10<xi<10


function [p,dp]=funMishra03(xx)

%constants
a=1e-2;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
pa=xxx.^2+yyy;
pb=xxx+yyy;
%
pc=abs(pa);
pd=sqrt(pc);
%
p=sqrt(abs(cos(pd)))+a*pb;

if nargout==2
    dp(:,:,1)=-0.5*xxx./pd...
        .*sin(pd)...
        .*sign(cos(pd))...
        .*sign(pa)...
        ./sqrt(abs(cos(pd)))...
        +a;
    dp(:,:,2)=-0.25./pd...
        .*sin(pd)...
        .*sign(cos(pd))...
        .*sign(pa)...
        ./sqrt(abs(cos(pd)))...
        +a;
end
end
