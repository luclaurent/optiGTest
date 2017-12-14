%% Custom function 5
%L. LAURENT -- 14/12/2017 -- luc.laurent@lecnam.net

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
%global minimum : f(x)=-1.12848 for x= -0.636071
%local minima
% f          | x
% -0.87707   | 0.620064
% -0.640515  | 1.87613
% -0.417063  | 3.13212
% -0.205166  | 4.38803
% -0.00346222| 5.64383
% 0.189252   | 6.89953
% 0.374037   | 8.1551
% 0.551826   | 9.41053
% 0.723445   | 10.6658
% 0.88962    | 11.9209
% 1.05099    | 13.1757
% 1.20812    | 14.4304
%
%
%
%Design space: -1<xi<15
%


function [p,dp,ddp]=funCustom05(xx)
%constants
a=10;
b=0;
c=5;

%evaluation and derivatives
%
p=exp(-x/a).*cos(c*x)+1/a*x+b;

%
if nargout==2
    %
    dp=-exp(-x/a).*(sin(x)+1/a.*cos(x))+1/a;
end
%
end