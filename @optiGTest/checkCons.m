%% check constraints status
function status=checkCons(obj,XX,num,ZZ)
%default values
numOk=[];
status=true;
if obj.nbCons>0
    availResp=false;availPts=false;
    %deal with input arguments
    if nargin==4, if ~isempty(ZZ);availResp=true;ZZOk=ZZ;end, end
    if nargin>1, if ~isempty(XX);availPts=true;end, end
    if nargin>2, if ~isempty(num);numOk=num;end, end
    %available sample points
    if availPts
        obj.prepX(XX);
        availResp=false; % priority on new sample points
    end
    % with no values of constraints
    if ~availResp
        %evaluation contraint(s)
        ZZOk=obj.evalCons([],numOk);
    end
    
    %% check constraints
    %specific constraint test
    if ~isempty(numOk)
        cellType=obj.typeCons(numOk);
    else
        cellType=obj.typeCons;
    end
    %obtain right function name
    testFun=cellfun(@(x)boolFun(x),cellType,'UniformOutput',false);
    %many constraints
    funCheck=@(x,y)y(x,0);
    if iscell(ZZOk)
        status=cellfun(funCheck,ZZOk,testFun);
    else
        status=feval(funCheck,ZZOk,testFun);
    end
    
else
    fprintf('No constraint function(s)\n');
end
end