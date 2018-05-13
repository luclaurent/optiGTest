%% evaluate all functions
function [ZZ,GZ,GG,GGG]=evalAll(obj,XX)
if nargin>1
    obj.prepX(XX);
end
% evaluate objective function(s)
[ZZ,GZ]=obj.evalObj;
% evaluate constraint function(s)
if nargout>2
    [GG,GGG]=obj.evalCons;
end
end