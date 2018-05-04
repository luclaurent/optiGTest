%% function for loading global minimum(s) of available multi-objective problems
% L. LAURENT --  04/05/2018 -- luc.laurent@lecnam.net

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

function [GlobX,GlobZ]=loadGlobMinMulti(funName,dim)
listGlobXmin=struct(...
    'test',[1,1]);

%%%%%%%
listGlobZmin=struct(...
    'test',0,...
    'RosenbrockDisk',0);

lGX=listGlobXmin.(funName);
lGZ=listGlobZmin.(funName);

if size(lGX,2)==1
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