%% Cosine Mixture function
%L. LAURENT -- 04/11/2016 -- luc.laurent@lecnam.net
%
%numerous local minima
%1 global minimum : x=(0,0,...,0) >> f(x)=0
%
%design space -1<xi<1

function [p,dp]=funCosineMixture(xx)

%constants
a=0.1;
b=5*pi;

%evaluation and derivatives
pa=cos(b*xx);
pb=xx.^2;
p=a*sum(pa,3)+sum(pb,3);
if nargout==2
    dp=-a*b*sin(b*xx)+2*xx;
end
end