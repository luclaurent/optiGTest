%% Parsopoulos function
%L. LAURENT -- 17/11/2016 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=0 for x=(pi/2,pi)
%
%Design space: -5<xi<5


function [p,dp]=funParsopoulos(xx)

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
cx=cos(xxx);
sy=sin(yyy);
p=cx.^2+sy.^2;

if nargout==2
    dp(:,:,1)=-2*cos(xxx).*sin(xxx);
    dp(:,:,2)=2*cos(yyy).*sin(yyy);
end
end
