%% Ripple 25 function
%L. LAURENT -- 12/02/2017 -- luc.laurent@lecnam.net
%
%1 minimum global: x=0 >> f(-0.1,-0.1)=-2.2
%
%Design space 0<xi<1

function [p,dp]=funRipple01(xx)

%constants
a=2;
b=0.1;
c=0.8;
d=5*pi;
e=500*pi;

%evaluation and derivatives
pa=(xx-b)./c;
pb=-a*log(a)*pa.^2;
pc=-exp(pb);
sd=sin(d*xx);
ce=cos(e*xx);
pd=sd.^6+b*ce.^2;
cal=pc.*pd;
%
p=sum(cal,3);

if nargout==2
    dpd=6*d*sd.^5.*cos(d*xx)-2*e*b*ce.*sin(e*xx);
    dpb=-2*a*log(a).*pa.*pc./c;
    %
    dp=dpb.*pd+pc.*dpd;
end

end