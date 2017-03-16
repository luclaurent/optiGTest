%% Drop Wave function
%L. LAURENT -- 16/03/2017 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=-1 for xi=0
%
%Design space: -5.12<xi<5.12
%



function [p,dp]=funDropWave(xx)
%constants
a=1;
b=12;
c=2;
d=1/2;

%evaluation and derivatives
sxx=sum(xx.^2,3);
pa=a+cos(b*sxx);
pb=c+d*sxx;
%
p=-pa./pb;
%

%
if nargout==2
    %
    dp=(2*b*xx.*sin(b*sxx).*pb+2*d*xx.*pa)./pb.^2;
end
end
