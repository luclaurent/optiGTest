%% Method of optiGTest class
% L. LAURENT --  15/04/2018 -- luc.laurent@lecnam.net

% sources available here:
% https://bitbucket.org/luclaurent/optigtest/
% https://github.com/luclaurent/optigtest/

% optiGTest - set of testing functions    A toolbox to easy manipulate functions.
% Copyright (C) 2018  Luc LAURENT <luc.laurent@lecnam.net>
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

%% show 1D function
% INPUTS:
%  - XX: abscissa used for ploting
%  - ZZ, GZ: responses and gradients of 1 or many functions (stored in cell)
%  - txt: text to display in title [optional]
%  - funName: name the functions (stored in cell) [optional]
% OUTPUTS:
%  - h: handle of the figure


function h=show1D(obj,XX,ZZ,GZ,txt,funName)
nbR=1;
nbC=2;
if nargin<6;funName=[];end
if nargin<5;txt=[];end
%
if iscell(ZZ)
    nbR=numel(ZZ);
else
    ZZ={ZZ};
    GZ={GZ};
end
%
spaceX=[obj.xMin obj.xMax];
%
h=figure('NumberTitle', 'off', 'Name', [txt ' function']);
itS=1;
for itR=1:nbR
    subplot(nbR,nbC,itS)
    plot(XX,ZZ{itR});
    axis('tight','square')
    xlabel('x'), ylabel('F'), title(funName{itR})
    xlim(spaceX)
    subplot(nbR,nbC,itS+1)
    plot(XX,GZ{itR}(:,:,1));
    axis('tight','square')
    xlabel('x'), ylabel('dF/dx'), title(['Grad. ' funName{itR}])
    xlim(spaceX)
    itS=itS+2;
end
end