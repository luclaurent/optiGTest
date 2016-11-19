%% Quartic function
%L. LAURENT -- 19/11/2016 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=0 for xi=(0,...,0)
%
%Design space: -1.28<xi<1.28


function [p,dp]=funQuartic(xx)

%evaluation and derivatives
dim=size(xx,3);
pa=bsxfun(@times,xx.^4,reshape(1:dim,1,1,dim));
%
p=sum(pa,3)+randn(size(xx,1),size(xx,2));

if nargout==2    
    dp=4*bsxfun(@times,xx.^3,reshape(1:dim,1,1,dim));
end
end
