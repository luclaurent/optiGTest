%% CrownedCross function 
%L. LAURENT -- 14/03/2017 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=1e-4 for x1=0 (forall x2) or x2=0 (forall x1)
%
%Design space: -10<xi<10


function [p,dp]=funCrownedCross(xx)
%constants
a=0.1;
b=100;
c=pi;
d=1;
e=1e-4;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
%
xy=sqrt(x.^2+y.^2);
fxy=b-xy./c;
%
pa=exp(abs(fxy));
sx=sin(x);
sy=sin(y);
%
h=pa.*sx.*sy;
g=abs(h)+d;
%
p=e*g.^a;
%
if nargout==2
    %
    dh=cos(xx).*sin(xx(:,:,[2 1])).*pa-1/c*xx./xy.*sign(fxy).*h;
    %
    dg=sign(h).*dh;
    %
    dp=e*a*dg.*g.^(a-1);
end
end
