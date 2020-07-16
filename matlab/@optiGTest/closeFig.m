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

%% close all opened figures

function closeFig(obj)
if ~isempty(obj.figureHandle)
    %use temporary list of figures
    tmpFigHandle=obj.figureHandle;
    for itF=1:numel(tmpFigHandle)
        %close figure
        %try
        close(tmpFigHandle(itF));
        %catch
        %    keyboard
        %end
        %remove it from the list
        obj.figureHandle=1;
    end
end
end