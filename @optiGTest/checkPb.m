%% check function by checking minimum and gradients
function isOk=checkPb(obj,pbName,statusPause)
if nargin==0; pbName=obj.namePb;end
if nargin<3; statusPause=false;end
%check minimum
obj.namePb=pbName;
%check minimum on objective function
isOk=obj.checkFunObj;
%check gradients
% of objective function(s)
for itF=1:obj.nbObj
    funCheck=@(X)obj.evalObj(X,itF);
    isOkCurrent=obj.checkGradFun(funCheck,obj.funObj{itF});
    isOk=isOk&&isOkCurrent;
end
% of constraint function(s)
if obj.nbCons>0
    for itF=1:obj.nbCons
        funCheck=@(X)obj.evalCons(X,itF);
        isOkCurrent=obj.checkGradFun(funCheck,obj.funCons{itF});
        isOk=isOk&&isOkCurrent;
    end
end
if ~isOk&&statusPause
    pause
end
end