%% optiGTest class of test functions/problems w/- or w/o constraint(s)
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

%% function display table with two columns of text

function txt=dispTableTwoColumns(tableA,tableB,separator)
%size of every components in tableA
sizeA=cellfun(@numel,tableA);
maxA=max(sizeA);
%space after each component
spaceA=maxA-sizeA+2;
if nargin>2
    spaceTxt=separator;
else
    spaceTxt=' ';
end
txtOk=[];
%display table
for itT=1:numel(tableA)
    if ischar(tableB{itT})
        mask='%s%s%s\n';
    elseif isinteger(tableB{itT})
        mask='%s%s%i\n';
    else
        mask='%s%s%+5.4e\n';
    end
    %
    txtOk=[txtOk sprintf(mask,tableA{itT},[' ' spaceTxt(ones(1,spaceA(itT))) ' '],tableB{itT})];
end
if nargout==1
    txt=txtOk;
else
    Gfprintf(txtOk);
end
end