%% prepare the sample point for evaluation
function Xeval=prepX(obj,XX)
sX=[size(XX,1) size(XX,2) size(XX,3)];
nbvar=sX(3);
if any(isinf(obj.dimAvailable))
    if nbvar==1
        obj.Xeval=reshape(XX,[],1,sX(2));
    else
        obj.Xeval=XX;
        obj.dim=nbvar;
    end
else
    if nbvar==obj.dim
        obj.Xeval=XX;
    elseif nbvar==1
        if sX(2)==obj.dim
            obj.Xeval=reshape(XX,[],1,sX(2));
        else
            fprintf(['Wrong size of sample points (' mfilename ')\n']);
        end
    else
        fprintf(['Wrong size of sample points (' mfilename ')\n']);
    end
end
Xeval=obj.Xeval;
end