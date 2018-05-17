%% build Markdown table of the functions (with dimension)
function buildTableMD(funName,dimL,nbCol,nbObj,nbCons)

if nargin<5
    nbObj=0;
    nbCons=0;
end
%check
flagCons=true;
if all(nbObj==0)
    flagCons=false;
end
%
nbFun=numel(funName);
nbFunPerCol=round(nbFun/(nbCol));
%
funTable=cell(nbFunPerCol,nbCol);
dimTable=cell(nbFunPerCol,nbCol);
for itF=1:nbFun
    funTable{itF}=funName{itF};
    dimTable{itF}=dimL{itF};
end
funTable=funTable';
dimTable=dimTable';

itF=1;
for itR=1:nbFunPerCol
    if itR==1
        fprintf(repmat('|-',1,nbCol));
        fprintf('|\n');
        fprintf(repmat('|-----',1,nbCol));
        fprintf('|\n');
    end
    for itC=1:nbCol
        if ~isempty(funTable{itF})
            fprintf('| %s (',funTable{itF});
            fprintf('%i',dimTable{itF});
            if flagCons
                fprintf(', %i/%i)',nbObj(itF),nbCons(itF));
            else
                fprintf(')');
            end
        end
        if itC==nbCol
            fprintf('|\n');
        end
        itF=itF+1;
    end
end
end