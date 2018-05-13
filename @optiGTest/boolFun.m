%% function for finding relation operator of boolean test
function txtFun=boolFun(txtSymbol)
txtFun='';
if isa(txtSymbol,'function_handle')
    txtFun=txtSymbol;
else
    switch txtSymbol
        case {'==','eq'}
            txtFun=@eq;
        case {'~=','ne'}
            txtFun=@ne;
        case {'<=','=<','le'}
            txtFun=@le;
        case {'>=','=>','ge'}
            txtFun=@ge;
        case {'<','lt'}
            txtFun=@lt;
        case {'>','gt'}
            txtFun=@gt;
    end
end
end