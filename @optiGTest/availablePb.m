%% function for checking if the function is available
function [funOk,typePb]=availablePb(txt)
funOk=false;
%extract name of functions
strPbUn=loadDimUn();
strPbCons=loadDimCons();
strpbMulti=loadDimMulti();
%
listPbUn=fieldnames(strPbUn);
listPbCons=fieldnames(strPbCons);
listPbMulti=fieldnames(strpbMulti);
%
%check if function is available and which case of pb it is
if any(ismember(listPbUn,txt))
    funOk=true;
    typePb='Un';
end
if any(ismember(listPbCons,txt))
    funOk=true;
    typePb='Cons';
end
if any(ismember(listPbMulti,txt))
    funOk=true;
    typePb='Multi';
end
end