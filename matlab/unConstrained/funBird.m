%% Bird's function
%L. LAURENT -- 31/10/2016 -- luc.laurent@lecnam.net

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
%one local minimum
%1 global minimum : x={(4.70104,3.15294),(-1.58214, -3.13024)} >> f(x)=-106.764537
%
%design space -2pi<xi<2pi



function [p,dp]=funBird(xx)

%evaluate responses
xxx=xx(:,:,1);
yyy=xx(:,:,2);
sx=sin(xxx);
cy=cos(yyy);
ex1=exp((1-cy).^2);
ex2=exp((1-sx).^2);
fxy=(xxx-yyy).^2;
p=sx.*ex1+cy.*ex2+fxy;

%evaluate derivatives
if nargout==2
    cx=cos(xxx);
    sy=sin(yyy);
    dp(:,:,1)=cx.*ex1-2*cy.*cx.*(1-sx).*ex2+2*(xxx-yyy);
    dp(:,:,2)=2*sx.*sy.*(1-cy).*ex1-sy.*ex2-2*(xxx-yyy);
end
end