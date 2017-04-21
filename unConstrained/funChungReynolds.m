%% Chung Reynolds's function
%L. LAURENT -- 04/11/2016 -- luc.laurent@lecnam.net
%
%numerous local minima
%1 global minimum : x=(0,0,...,0) >> f(x)=0
%
%design space -1<xi<4



function [p,dp]=funChungReynolds(xx)


%evaluation and derivatives
pSum=sum(xx.^2,3);
p=pSum.^2;
if nargout==2
    dp=4*xx.*repmat(pSum,[1 1 size(xx,3)]);
end
end
