%% Exponential function
%L. LAURENT -- 16/11/2016 -- luc.laurent@lecnam.net
%
%one local minimum
%1 global minimum : x=(0,...,0) >> f(x)=1
%
%design space -1<xi<1


function [p,dp]=funExponential(xx)

%constants
a=0.5;

%evaluations and derivatives
p=-exp(-a*sum(xx.^2,3));

if nargout==2
    dp=-2*a*bsxfun(@times,p,xx);
end
end