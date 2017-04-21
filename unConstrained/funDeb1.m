%% Deb1's function
%L. LAURENT -- 06/11/2016 -- luc.laurent@lecnam.net
%
%numerous local minima
%5^np global minimum : 
%
%design space -1<xi<1


function [p,dp]=funDeb1(xx)

%constans
a=6;
b=5*pi;

%evaluation and derivatives
nS=size(xx,3);
sx=sin(b*xx);
p=-1/nS*sum(sx.^a,3);
if nargout==2
    cx=cos(b*xx);
    dp=-1/nS*b*a*cx.*sx.^(a-1);
end
end
