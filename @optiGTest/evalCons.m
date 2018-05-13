%% evaluate the constraint functions
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