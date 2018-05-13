%% load objective and constraints functions and type of constraints
function loadPb(obj)
%
[funOk,typeTxt]=availablePb(obj.namePb);
%
if funOk
    switch typeTxt
        case {'Cons','Multi'}
            [obj.funObj,obj.funCons,obj.typeCons]=feval(['loadProb' typeTxt],obj.namePb);
        otherwise
            obj.funObj={obj.namePb};
            obj.funCons={};
            obj.typeCons={};
    end
end
% load available dimension
obj.loadDimAvailable;
%load default dimension
obj.dim=obj.getDimAvailable;
end