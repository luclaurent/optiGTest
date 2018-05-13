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

%% load objective and constraints functions and type of constraints

function loadPb(obj)
%
[funOk,typeTxt]=availablePb(obj.namePb);
%
if funOk
    switch typeTxt
        case {'Cons','Multi'}
            [obj.funObj,obj.funCons,obj.typeCons]=feval(['loadProb' typeTxt],obj.namePb);
        otherwise
            obj.funObj={obj.namePb};
            obj.funCons={};
            obj.typeCons={};
    end
end
% load available dimension
obj.loadDimAvailable;
%load default dimension
obj.dim=obj.getDimAvailable;
end