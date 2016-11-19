%% Quartic function
%L. LAURENT -- 19/11/2016 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=0 for xi=(1 or 2)
%
%Design space: -10<xi<10


function [p,dp]=funQuintic(xx)

%constants
a=3;
b=4;
c=2;
d=10;
e=4;

%evaluation and derivatives
pa=xx.^5-a*xx.^4+b*xx.^3+c*xx.^2-d*xx-e;
%
p=sum(abs(pa),3);

if nargout==2    
    dp=(5*xx.^4-4*a*xx.^3+3*b*xx.^2+2*c*xx-d).*sign(pa);
end
end
