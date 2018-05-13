%% display details about the defined problem
function dispDetails(obj)
if ~isempty(obj.namePb)
    fprintf('\n## Problem: %s\n',obj.namePb);
    fprintf('# Objective function(s):');
    %
    funDisp=@(x)fprintf(' %s,',x);
    %
    if obj.nbObj>1
        cellfun(funDisp,obj.funObj);
    else
        fprintf(' %s',obj.funObj{1});
    end
    fprintf('\n');
    %
    fprintf('# Constraint function(s):');
    if obj.nbCons==0
        fprintf(' None\n');
    elseif obj.nbCons==1
        fprintf(' %s',obj.funCons);
    else
        cellfun(funDisp,obj.funCons);
    end
    %
    fprintf('# Considered dimension: %i\n',obj.dim);
    fprintf('# Considered design space:\n');
    fprintf('#  Min: ');fprintf('%-+d ',obj.xMin);fprintf('\n');
    fprintf('#  Max: ');fprintf('%-+d ',obj.xMax);fprintf('\n');
    fprintf('# Considered global minimum(s) (sample points and response value(s)):\n');
    %
    Xmin=obj.globMinX;
    Zmin=obj.globMinZ;
    for itM=1:numel(Zmin)
        fprintf('#  %-+d\t%-+d || %d \n',Xmin(itM,:),Zmin(itM));
    end
    fprintf('\n');
end
end