%% Ripple 25 function
%L. LAURENT -- 14/02/2017 -- luc.laurent@lecnam.net
%
%252004 local minima
%1 minimum global: x=0 >> f(-2.1,-2.1)=0
%
%Design space 0<xi<1

function [p,dp]=funRipple25(xx)

%constants
a=2;
b=0.1;
c=0.8;
d=5*pi;

%evaluation and derivatives
pa=(xx-b)./c;
pb=-a*log(a)*pa.^2;
pc=-exp(pb);
sd=sin(d*xx);
pd=sd.^6;
cal=pc.*pd;
%
p=sum(cal,3);

if nargout==2
    dpd=6*d*sd.^5.*cos(d*xx);
    dpb=-2*a*log(a).*pa.*pc./c;
    %
    dp=dpb.*pd+pc.*dpd;
end

end