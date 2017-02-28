%% Xin-She-Yang 2 function
% L. LAURENT -- 28/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(0,...,0)=0
%
%Design space -2pi<xi<2pi

function [p,dp] = funXinSheYang2(xx)

%evaluation and derivatives
pa=abs(xx);
pb=sin(xx.^2);
%
pA=sum(pa,3);
pB=sum(pb,3);
pC=exp(pB);
%
p=pA./pC;

if nargout==2
    dp=(sign(xx).*pC-2*xx.*cos(xx.^2).*pC.*pA)./pC.^2;    
end
end

