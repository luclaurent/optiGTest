%% Method of optiGTest class
% L. LAURENT --  17/05/2018 -- luc.laurent@lecnam.net

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


%% show 2D function wiyth constraints
% INPUTS:
%  - XX, YY: meshgrid used for ploting
%  - ZZ, GZ: responses and gradients of 1 or many functions (stored in cell)
%  - statusZ: status of the constraint (stored in cell)
%  - txt: text to display in title [optional]
%  - funName: name the functions (stored in cell) [optional]
% OUTPUTS:
%  - h: handle of the figure

function h=show2DCons(obj,XX,YY,ZZ,statusZ,txt,funName)
nbC=2;
nbLevel=10;
%
if nargin<6;funName{1}='';end
if nargin<5;txt=[];end
%
if iscell(ZZ)
    nbR=numel(ZZ);
    if numel(funName)==1&&nbR~=1
        funName=repmat({''},1,nbR);
    end
else
    nbR=1;
    nbC=2;
    %
    ZZ={ZZ};
end
if ~iscell(statusZ)
    statusZ={statusZ};
end
%manage status of the constraint(s)
statusDouble=cellfun(@double,statusZ,'UniformOutput',false);
matStatus=cat(3,statusDouble{:});
fullStatus=prod(matStatus,3);
fullStatus(fullStatus==0)=NaN;
%deactivate violated values
ZZplot=cellfun(@(x)fullStatus.*x,ZZ,'UniformOutput',false);
%
spaceX=[obj.xMin(1) obj.xMax(1)];
spaceY=[obj.xMin(2) obj.xMax(2)];
%
h=figure('NumberTitle', 'off', 'Name', [txt ' function']);
itS=1;
warning off all;
for itR=1:numel(ZZ)
    subplot(nbR,nbC,itS)
    surfCustom(XX,YY,ZZplot{itR});
    axis('tight','square')
    xlabel('x'), ylabel('y'), title(funName{itR})
    xlim(spaceX)
    ylim(spaceY)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%
    subplot(nbR,nbC,itS+1)
    contourf(XX,YY,ZZplot{itR},nbLevel);
    axis('tight','square')
    xlabel('x'), ylabel('y'), title(funName{itR})
    xlim(spaceX)
    ylim(spaceY)
    %
    itS=itS+2;
end
warning on all;
end