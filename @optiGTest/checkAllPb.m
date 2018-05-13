%% check all functions
function isOk=checkAllPb(obj,varargin)
%default values
isOk=true;
flag=false;
typeCheckPb='';
%deal with input arguments
for itV=1:numel(varargin)
    if  islogical(varargin{itV})
        flag=varargin{itV};
    elseif ischar(varargin{itV})
        typeCheckPb=varargin{itV};
    end
end

%extract list of problems
listFun=listPb(typeCheckPb);
if flag %check all by continuing at the current position
    currPos=find(ismember(listFun,obj.consPb));
    currPos=currPos(1);
    listFun=listFun(currPos:end);
end
%check every function
for itF=1:numel(listFun)
    fprintf(' >>> Problem %s\n',listFun{itF});
    tmpStatus=obj.checkPb(listFun{itF},true);
    isOk=isOk&&tmpStatus;
end
end