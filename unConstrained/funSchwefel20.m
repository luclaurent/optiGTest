%% Schwefel 20 function
% L. LAURENT -- 19/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(0,...,0)=0
%
%Design space -100<xi<100


function [p,dp] = funSchwefel20(xx)

%evaluation and derivatives
pa=abs(xx);
%
p=sum(pa,3);

if nargout==2
    %
    dp=sign(xx);
end
end
