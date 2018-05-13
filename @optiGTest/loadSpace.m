%% load data about the design space
function [X,Z]=loadSpace(obj)
%
[X,Z]=feval(['loadSpace' obj.typePb],obj.namePb,obj.dim);
end