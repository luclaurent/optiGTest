%% load data about global minimum
function [X,Z]=loadGlobMin(obj)
%
[X,Z]=feval(['loadGlobMin' obj.typePb],obj.namePb,obj.dim);
end