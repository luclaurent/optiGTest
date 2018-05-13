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

%% evaluate the constraint function(s)
% INPUTS:
%  - XX: sample points on which the constraint function(s) will be evaluate [optional]
%  - num: number of the requested  constraint function(s) in the case of problem with many constraints [optional]
% OUTPUTS (empty if the problem does not have any constraint):
%  - ZZ, GZ: responses and gradients of the constraint function(s) stored in cells (in the case of one requested contraint function problem no cell is used)
%  - GZrehape: specific storage of the gradients for meshgrid

function [ZZ,GZ,GZreshape]=evalCons(obj,XX,num)
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
if obj.nbCons>0
    %specific constraint function
    if ~isempty(numOk)
        cellCons=obj.funCons(numOk);
    else
        cellCons=obj.funCons;
    end
    %
    nbF=numel(cellCons);
    %evaluate (all) objective function(s)
    funE=@(x,y)feval(['fun' x],y);
    %%
    if nargout>1
        [ZZtmp,GZtmp]=cellfun(@(x)funE(x,Xrun),cellCons,'UniformOutput',false);
    else
        [ZZtmp]=cellfun(@(x)funE(x,Xrun),cellCons,'UniformOutput',false);
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
            funR=@(x)reshape(x,[],size(x,3));
            GZreshape=cellfun(funR,GZ,'UniformOutput',false);
        end
    end
else
    fprintf('No constraint function(s)\n');
    ZZ=NaN;
    GZ=NaN;
    GZreshape=NaN;
end
end