%% Deb2's function
%L. LAURENT -- 06/11/2016 -- luc.laurent@lecnam.net
%
%numerous local minima
%5^np global minimum : 
%
%design space -1<xi<1


function [p,dp]=funDeb2(xx)

%constans
a=6;
b=5*pi;
c=2*log(2);
d=0.1;
e=0.8;

%evaluation and derivatives
nS=size(xx,3);
sx=sin(b*xx);
ex=exp(-c*((xx-d)./e).^2);
p=-1/nS*sum(ex.*sx.^a,3);
if nargout==2
    cx=cos(b*xx);
    dex=-2*c/e*(xx-d)./e;
    %
    dp=-1/nS*ex.*(b*a*cx.*sx.^(a-1)+sx.^a.*dex);
end
end
