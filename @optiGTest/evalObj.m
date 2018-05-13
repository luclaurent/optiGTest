%% evaluate the objective function
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