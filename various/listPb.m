%% extract list of problems
function l=listPb(typePb)

if nargin==0;typePb='';end

switch typePb
    case {'UnConstrained','Un','un','Unconstrained','unconstrained'}
        strPb=loadDimUn();
        l=fieldnames(strPb);
    case {'Constrained','Cons','cons','constrained'}
        strPb=loadProbCons();
        %
        l=fieldnames(strPb);
    case {'MultiObj','Multi','multi','Multiobj','multiobj'}
        strPb=loadProbMulti();
        %
        l=fieldnames(strPb);
    otherwise
        strPbUn=loadDimUn();
        strPbCons=loadProbCons();
        strPbMulti=loadProbMulti();
        %
        listPbUn=fieldnames(strPbUn);
        listPbCons=fieldnames(strPbCons);
        listPbMulti=fieldnames(strPbMulti);
        %        
        l=vertcat(listPbUn,listPbCons,listPbMulti);
end
end