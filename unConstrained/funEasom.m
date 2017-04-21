%% Easom's function
%L. LAURENT -- 15/11/2016 -- luc.laurent@lecnam.net
%
%4 global minimas : f(x1,x2)=-1 for (-pi,pi)
%
%Design space: -100<xi<100


function [p,dp]=funEasom(xx)

%constants
a=pi;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
cx=cos(xxx);
cy=cos(yyy);
xp=xxx-a;
yp=yyy-a;
exy=exp(-xp.^2-yp.^2);
p=-cx.*cy.*exy;
%
if nargout==2
    sx=sin(xxx);
    sy=sin(yyy);
    %
    dp(:,:,1)=exy.*(sx.*cy+2*xp.*cx.*cy);
    dp(:,:,2)=exy.*(sy.*cx+2*yp.*cx.*cy);
end
end