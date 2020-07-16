%% Xin-She-Yang 4 function
% L. LAURENT -- 28/02/2017 -- luc.laurent@lecnam.net

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

%1 minimum global: f(0,...,0)=-1
%
%Design space -10<xi<10

function [p,dp] = funXinSheYang4(xx)


%evaluation and derivatives
pa=sin(xx);
pAA=sum(pa.^2,3);
%
pb=xx.^2;
pB=sum(pb,3);
pBB=exp(-pB);
%
pc=sin(sqrt(abs(xx)));
pC=sum(pc.^2,3);
pCC=exp(-pC);
%
p=(pAA-pBB).*pCC;

if nargout==2
    dp=2*(pa.*cos(xx)+xx.*pBB).*pCC ...
        -(pAA-pBB).*sign(xx)./sqrt(abs(xx)).*pc.*cos(sqrt(abs(xx))).*pCC;
end
end

