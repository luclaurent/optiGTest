%% Function for finding relation operator of boolean test
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


function txtFun=boolFun(txtSymbol)
txtFun='';
if isa(txtSymbol,'function_handle')
    txtFun=txtSymbol;
else
    switch txtSymbol
        case {'==','eq'}
            txtFun=@eq;
        case {'~=','ne'}
            txtFun=@ne;
        case {'<=','=<','le'}
            txtFun=@le;
        case {'>=','=>','ge'}
            txtFun=@ge;
        case {'<','lt'}
            txtFun=@lt;
        case {'>','gt'}
            txtFun=@gt;
    end
end
end