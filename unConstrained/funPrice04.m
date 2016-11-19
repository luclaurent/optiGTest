%% Price 4 function
%L. LAURENT -- 17/11/2016 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=0 for x={(0,0),(2,4),(1.464,?2.506)}
%
%Design space: -500<xi<500


function [p,dp]=funPrice04(xx)

%constants
a=2;
b=6;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
g=a*xxx.^3.*yyy-yyy.^3;
h=b*xxx-yyy.^2+yyy;
%
p=g.^2+h.^2;

if nargout==2
    dp(:,:,1)=6*a*xxx.^2.*yyy.*g+2*b*h;
    dp(:,:,2)=2*(a*xxx.^3-3*yyy.^2).*g+(1-2*yyy).*h;
end
end
