%% Schwefel 1 function
% L. LAURENT -- 19/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(0,...,0)=0
%
%Design space -100<xi<100


function [p,dp] = funSchwefel01(xx)

%constants
a=sqrt(pi);

%evaluation and derivatives
pa=xx.^2;
spa=sum(pa,3);
%
p=spa.^a;

if nargout==2
    %
    dp=2*a*xx.*spa.^(a-1);
end
end
