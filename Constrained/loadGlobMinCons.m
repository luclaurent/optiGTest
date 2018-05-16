%% function for loading global minimum(s) of constrained problems
% L. LAURENT --  02/05/2018 -- luc.laurent@lecnam.net

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

function [GlobX,GlobZ]=loadGlobMinCons(funName,dim)

isDimOk=false;
if nargin>0
   isDimOk=numel(dim>0)&&~any(isnan(dim))&&~any(isinf(dim));
end

if ~isDimOk;dim=1;end

listGlobXmin=struct(...
    'RosenbrockCubicLine',[1,1],...
    'RosenbrockDisk',[1 1],...
    'BirdDisk',[-1.5821422,-3.1302468],...
    'Townsend',[2.0052938,1.1944506],...
    'Simionescu',[-0.84852813,0.84852813;0.84852813,-0.84852813]);

%%%%%%%
listGlobZmin=struct(...
    'RosenbrockCubicLine',0,...
    'RosenbrockDisk',0,...
    'BirdDisk',-106.7645367,...
    'Townsend',-2.0239884,...
    'Simionescu',-0.072);%-0.072625

lGX=listGlobXmin.(funName);
lGZ=listGlobZmin.(funName);

if size(lGX,2)==1&&isDimOk
    GlobX=repmat(lGX,[1,dim]);
else
    GlobX=lGX;
end
if length(lGZ)==1&&size(lGX,1)>1
    GlobZ=repmat(lGZ,[size(lGX,1),1]);
else
    GlobZ=lGZ;
end
end