%% Deb4's function
%L. LAURENT -- 06/11/2016 -- luc.laurent@lecnam.net
%
%numerous local minima
%5^np global minimum : 
%
%design space -1<xi<1


function [p,dp]=funDeb4(xx)

%constans
a=6;
b=5*pi;
c=3/4;
d=0.05;
e=2*log(2);
f=0.08;
g=0.854;

%evaluation and derivatives
nS=size(xx,3);
sx=sin(b*(xx.^c-d));
ex=exp(-e*((xx-f)./g).^2);
p=-1/nS*sum(ex.*sx.^a,3);

if nargout==2
    cx=cos(b*(xx.^c-d));
    dp=-1/nS*ex.*(b*a*c*xx.^(c-1).*cx.*sx.^(a-1)+sx.^a.*(-2*e/g*(xx-f)./g));
end
end
