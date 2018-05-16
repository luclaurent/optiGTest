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


%% show Pareto
% INPUTS:
%  - XX: sample points
% OUTPUTS:
%  - h: handle of the figure

function h=showPareto(obj,XX)
if nargin>1
    if ~isempty(XX)
        obj.prepX(XX);
    end
end
Zrun=obj.evalObj;
%
h=figure;
if obj.nbObj==2
    plot(Zrun{1},Zrun{2},'.');
    xlabel('f1');
    ylabel('f2');
elseif obj.nbObj==3
    plot3(Zrun{1},Zrun{2},Zrun{3},'.');
    xlabel('f1');
    ylabel('f2');
    zlabel('f2');
else
    fprintf('Unable to show the Paretos front\n');
end
end