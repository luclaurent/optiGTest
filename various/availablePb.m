%% Function for checking if the function is available
% L. LAURENT --  04/05/2018 -- luc.laurent@lecnam.net

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

function [funOk,typePb]=availablePb(txt)
funOk=false;
%extract name of functions
strPbUn=loadDimUn();
strPbCons=loadDimCons();
strpbMulti=loadDimMulti();
%
listPbUn=fieldnames(strPbUn);
listPbCons=fieldnames(strPbCons);
listPbMulti=fieldnames(strpbMulti);
%
%check if function is available and which case of pb it is
if any(ismember(listPbUn,txt))
    funOk=true;
    typePb='Un';
end
if any(ismember(listPbCons,txt))
    funOk=true;
    typePb='Cons';
end
if any(ismember(listPbMulti,txt))
    funOk=true;
    typePb='Multi';
end
end