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

%% evaluate the objective function(s)
% INPUTS:
%  - XX: sample points on which the function(s) will be evaluate [optional]
%  - num: number of the requested function(s) in the case of multiobjective problem [optional]
% OUTPUTS:
%  - ZZ, GZ: responses and gradients of the function(s) stored in cells (in the case of one requested function or monoobjective problem no cell is used)
%  - GZrehape: specific storage of the gradients for meshgrid

function [ZZ,GZ,GZreshape]=evalObj(obj,XX,num)
%default values
Xrun=obj.Xeval;
numOk=[];
if nargin>2, if ~isempty(num);numOk=num;end, end
%
if nargin>1
    if ~isempty(XX)
        Xrun=obj.prepX(XX);
    end
end
%
%specific objective function(s)
if ~isempty(numOk)
    cellObj=obj.funObj(numOk);
else
    cellObj=obj.funObj;
end
%
nbF=numel(cellObj);
ZZtmp=cell(1,nbF);
if nargout>1;GZtmp=cell(1,nbF);end
%evaluate (all) objective function(s)
for itF=1:numel(cellObj)
    if nargout>1
        [ZZtmp{itF},GZtmp{itF}]=feval(['fun' cellObj{itF}],Xrun);
    else
        [ZZtmp{itF}]=feval(['fun' cellObj{itF}],Xrun);
    end
end
%reshape data
if nbF==1
    ZZ=ZZtmp{1};
    if nargout>1
        GZ=GZtmp{1};
    end
else
    ZZ=ZZtmp;
    if nargout>1
        GZ=GZtmp;
    end
end
if nargout>2
    if nbF==1
        GZreshape=reshape(GZ,[],size(GZ,3));
    else
        GZreshape=cell(1,nbF);
        for itF=1:numel(cellObj)
            GZreshape{itF}=reshape(GZ{itF},[],size(GZ{itF},3));
        end
    end
end
end