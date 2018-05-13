%% check any function
function isOk=checkFunObj(obj)
isOk=true;
%load dimension
dimCheck=obj.getDimAvailable;
%
if isinf(dimCheck);dimCheck=5;end
if numel(dimCheck)~=1;[~,II]=min(abs(dimCheck-5));dimCheck=dimCheck(II);end
obj.dim=dimCheck;
%details of minimum
X=obj.globMinX;
Z=obj.globMinZ;
%threshold
limO=1e-4;
% works only for non multiobjective problems
if ~any(isnan(Z))
    if size(X,2)>obj.dim
        X=X(:,1:obj.dim);
    end
    %compute objective value
    ZZ=obj.evalObj(X);
    %
    if all(abs(ZZ(:)-Z(:))>limO)
        fprintf('Issue with the %s function (wrong minimum obtained)\n',obj.namePb);
        fprintf('Obtained: ');fprintf('%d ',ZZ(:)');
        fprintf('\n');
        fprintf('Expected: ');fprintf('%d ',Z(:)');
        fprintf('\n');
        isOk=false;
    end
end
end