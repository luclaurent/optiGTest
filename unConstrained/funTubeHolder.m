%% Test Tube Holder function
% L. LAURENT -- 22/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(pi/2,0)=-10.872299901558
%
%Design space -10<xi<10


function [p,dp] = funTubeHolder(xx)

%constants
a=4;
b=1/200;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
%
pa=b*x.^2+b*y.^2;
ca=cos(pa);
sx=sin(x);
cy=cos(y);
%
g=exp(abs(ca)).*sx.*cy;
p=-a*abs(g);

if nargout==2
    %
    cx=cos(x);
    sy=sin(y);
    dk(:,:,1)=cx.*cy;
    dk(:,:,2)=-sx.*sy;
    %
    sa=sin(pa);
    dh=-2*b*xx.*sa.*sign(ca);
    %
    dg=dh.*g+exp(abs(ca)).*dk;
    %
    dp=-a*dg.*sign(g);
end
end
