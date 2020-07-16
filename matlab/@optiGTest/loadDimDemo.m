%% Method of optiGTest class
% L. LAURENT --  03/07/2020 -- luc.laurent@lecnam.net

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

%% load the right dimension for demo mode

function dim=loadDimDemo(obj)
%
loadDimOk=false;
%
if isinf(obj.dimAvailable)
    dim=2;
    loadDimOk=true;
end
%
if ~loadDimOk
    if numel(obj.dimAvailable)>0
        if any(obj.dimAvailable==2)
            dim=2;
        elseif any(obj.dimAvailable==1)
            dim=1;
        else
            dim=obj.dimAvailable(1);
        end
    else
        dim=obj.dimAvailable;
    end
end
end