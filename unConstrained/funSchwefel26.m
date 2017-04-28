%% Schwefel 26 function
%L. LAURENT -- 26/01/2011 -- luc.laurent@lecnam.net
%modif on the 16/09/2011 -- change to n variables
%
%numerous local minima
%1 global minimum : x=(420.968746,420.968746,...,420.968746) >> f(x)=0
%
%Design space: -500<xi<500

function [p,dp]=funSchwefel26(xx)

%constants
a=418.9829;
nbvar=size(xx,3);

%evaluation and derivatives
pa=abs(xx);
sqa=sqrt(pa);
ssqa=sin(sqa);
pb=xx.*ssqa;
%
p=a*nbvar-sum(pb,3);
%
if nargout==2
    %
    csqa=cos(sqa);
    dp=-ssqa-xx.*sign(xx).*csqa./(2*sqa);
    iXZ=(abs(xx(:))<eps);
    dp(iXZ)=0;
end

end
