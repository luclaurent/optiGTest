%% Schwefel 23 function
%L. LAURENT -- 28/04/2017 -- luc.laurent@lecnam.net
%
%numerous local minima
%1 global minimum : x=(0,0,...,0) >> f(x)=0
%
%Design space: -10<xi<10

function [p,dp]=funSchwefel23(xx)

%constants
a=10;

%evaluation and derivatives
pa=xx.^a;
%
p=sum(pa,3);
%
if nargout==2
    %
    dp=a*xx.^(a-1);
end

end
