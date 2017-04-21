%% Csendes's function
%L. LAURENT -- 16/09/2011 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=0 for (x)=(0,...,0)
%
%Design space: -1<xi<1


function [p,dp]=funCsendes(xx)

%constants
a=2;

%evaluation and derivatives
sx=sin(1./xx);
pa=a+sx;
pSum=xx.^6.*pa;
p=sum(pSum,3);
%
if nargout==2
    dp=6*xx.^5.*pa-xx.^4.*cos(1./xx);
end
end