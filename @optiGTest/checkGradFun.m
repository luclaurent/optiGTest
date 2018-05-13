%% check gradients of any function
function isOk=checkGradFun(obj,funCheck,funName)
%default
isOk=true;
if nargin<3;funName='';end
%threshold
lim=1e-5;
%space
XminSpace=obj.xMin;
XmaxSpace=obj.xMax;
%build sampling points
if exist('lhsdesign','file')
    Xsample=lhsdesign(obj.nSCheck,obj.dim);
else
    Xsample=rand(obj.nSCheck,obj.dim);
end
%rescale the samples
Xsample=Xsample.*repmat(XmaxSpace-XminSpace,obj.nSCheck,1)+repmat(XminSpace,obj.nSCheck,1);
%evaluate function at the sample
[~,~,GZactual]=funCheck(Xsample);
%compute approximate gradients using finite differences
FDclass=gradFD(obj.FDtype,Xsample,obj.FDstep,funCheck);
GZapprox=FDclass.GZeval;
%compare results
diffG=abs((GZactual-GZapprox)./GZactual);
diffGB=abs((GZactual-GZapprox)./(1+abs(GZactual)));
%remove bad terms
diffGtest=diffG(~isinf(diffG));
%
critCheckA=(any(diffGtest(:)>lim)...
    ||any(diffGB(:)>lim))...
    &&obj.paranoidCheck;
critCheckB=(sum(diffGtest(:)>lim)>floor(numel(diffGtest(:))/3)...
    ||sum(diffGB(:)>lim)>floor(numel(diffGB(:))/3))...
    &&~obj.paranoidCheck;
if critCheckA||critCheckB
    fprintf('Issue with the gradients of the %s function\n',funName);
    isOk=false;
end
if any(diffGtest(:)>lim)||any(diffGB(:)>lim)||obj.forceDisplayGrad
    fprintf(' >> %s function\n',funName);
    fprintf('Exact\n');
    for it=1:obj.nSCheck
        fprintf('%+7.3e ',GZactual(it,:));
        fprintf('\n');
    end
    fprintf('\n');
    fprintf('Finite Difference (%s, %7.3e)\n',obj.FDtype,obj.FDstep);
    for it=1:obj.nSCheck
        fprintf('%+7.3e ',GZapprox(it,:));
        fprintf('\n');
    end
    fprintf('\n');
    fprintf('Difference\n');
    for it=1:obj.nSCheck
        fprintf('%+7.3e ',diffG(it,:));
        fprintf('\n');
    end
    fprintf('\n');
    fprintf('DifferenceB\n');
    for it=1:obj.nSCheck
        fprintf('%+7.3e ',diffGB(it,:));
        fprintf('\n');
    end
    fprintf('\n');
    fprintf('Checking points\n');
    for it=1:obj.nSCheck
        fprintf('%+7.3e ',Xsample(it,:));
        fprintf('\n');
    end
end
end