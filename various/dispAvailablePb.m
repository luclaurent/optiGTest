%% display available testfunctions
function funOk=dispAvailablePb()
%extract name of porblems
strPbUn=loadDimUn();
strPbCons=loadProbCons();
strPbMulti=loadProbMulti();
%
listPbUn=fieldnames(strPbUn);
listPbCons=fieldnames(strPbCons);
listPbMulti=fieldnames(strPbMulti);
%count information
funCount=@(x,y,n)numel(x(n).(y));
nbConsPb=cellfun(@(x)funCount(strPbCons,x,3),listPbCons);
nbMultiConsPb=cellfun(@(x)funCount(strPbMulti,x,3),listPbMulti);
nbMultiObjPb=cellfun(@(x)funCount(strPbMulti,x,1),listPbMulti);
%
%Show existing problems
fprintf('=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=\n');
fprintf('Available test problems\n');
fprintf('------------------------\n');
cellfun(@(X)fprintf('Unconstrained: %s\n',X),listPbUn);
fprintf('------------------------\n');
fprintf('------------------------\n');
cellfun(@(X,Y,Z)fprintf('Constrained: %s (nb constraints: %i)\n',X,Y),...
    listPbCons,num2cell(nbConsPb));
fprintf('------------------------\n');
fprintf('------------------------\n');
cellfun(@(X,Y,Z)fprintf('Multiobjective: %s (nb objective/constraints: %i/%i)\n',X,Y,Z),...
    listPbMulti,num2cell(nbMultiObjPb),num2cell(nbMultiConsPb));
fprintf('------------------------\n');
fprintf('=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=\n');
end