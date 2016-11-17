%% Mishra 1 function
%L. LAURENT -- 17/11/2016 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=2 for x=?
%
%Design space: 0<xi<1


function [p,dp]=funMishra01(xx)
%constants
a=1;

%evaluation and derivatives
dim=size(xx,3);
xn=dim-sum(xx,3);
%
p=(a+xn).^xn;

if nargout==2
    dp=bsxfun(@times,(-log(a+xn)-xn./(a+xn)).*p,ones(1,1,dim));
end
end
