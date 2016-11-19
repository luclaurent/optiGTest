%% Qing function
%L. LAURENT -- 19/11/2016 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=0 for xi=(+/-sqrt(i),...,+/-sqrt(i))
%
%Design space: -500<xi<500


function [p,dp]=funQing(xx)

%evaluation and derivatives
dim=size(xx,3);
pa=bsxfun(@minus,xx.^2,reshape(1:dim,1,1,dim));
%
p=sum(pa.^2,3);

if nargout==2    
    dp=4*xx.*pa;
end
end
