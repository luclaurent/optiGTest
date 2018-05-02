%% function for loading design space of available functions
% L. LAURENT --  15/12/2017 -- luc.laurent@lecnam.net

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

function [xMin,xMax]=loadSpaceCons(funName,dim)
listSpace=struct(...
    'RosenbrockCubicLine',[-1.5 -0.5;1.5 2.5],...
    'RosenbrockDisk',1.5*[-1 -1;1 1],...
    'BirdDisk',[-10 -6.5;0 0],...
    'Townsend',[-2.25 -2.5;2.5 1.75],...
    'Simionescu',1.25*[-1 -1;1 1]);

spaceL=listSpace.(funName);
if size(spaceL,2)==1
    xMin=ones(1,dim)*spaceL(1);
    xMax=ones(1,dim)*spaceL(2);
else
    xMin=spaceL(1,:);
    xMax=spaceL(2,:);
end
end