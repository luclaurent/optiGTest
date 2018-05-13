%% build table of all function in Markdown
function isOk=funMD(obj,nbCol)
if nargin==1;nbCol=3;end
isOk=true;
%extract name of functions
strFun=loadDim();
listFun=fieldnames(strFun);
listDim=cell(1,numel(listFun));
for itF=1:numel(listFun)
    listDim{itF}=strFun.(listFun{itF});
end
%generate Markdown table
buildTableMD(listFun,listDim,nbCol);
end