%% load the available dimension for the considered test function
function loadDimAvailable(obj)
%
obj.dimAvailable=feval(['loadDim' obj.typePb],obj.namePb);
end