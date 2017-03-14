%% CarromTable function 
%L. LAURENT -- 14/03/2017 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=-24.15681551650653 for xi=+/- 9.646157266348881
%
%Design space: -10<xi<10


function [p,dp]=funCarromTable(xx)
%constants
a=30;
b=2;
c=1;
d=pi;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
%
xy=sqrt(x.^2+y.^2);
fxy=c-xy./d;
%
pa=exp(b*abs(fxy));
cx=cos(x);
cy=cos(y);
%
p=-1/a*pa.*cx.^2.*cy.^2;

if nargout==2
    %
    dp=-b/d*xx./xy.*sign(fxy).*p...
        +2*sin(xx).*cos(xx)./a.*pa.*cos(xx(:,:,[2 1])).^2;
end
end
