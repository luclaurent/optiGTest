%% Mishra 6 function
%L. LAURENT -- 17/11/2016 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=-2.28395 for x=(2.88631, 1.82326)
%
%Design space: -10<xi<10


function [p,dp]=funMishra06(xx)

%constants
a=1e-2;
b=1;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
g=cos(xxx)+cos(yyy);
h=sin(xxx)+sin(yyy);
kx=xxx-b;
ky=yyy-b;
pa=sin(g.^2).^2-cos(h.^2).^2+xxx;
%
p=-log(pa.^2)+a*(kx.^2+ky.^2);

if nargout==2
    dgX=-sin(xxx);
    dgY=-sin(yyy);
    dhX=cos(xxx);
    dhY=cos(yyy);
    %
    dp(:,:,1)=-2*pa.*(4*dgX.*g.*cos(g.^2).*sin(g.^2)...
        +4*dhX.*h.*sin(h.^2).*cos(h.^2)+1)./pa.^2 ...
        +2*a*kx;
    dp(:,:,2)=-2*pa.*(4*dgY.*g.*cos(g.^2).*sin(g.^2)...
        +4*dhY.*h.*sin(h.^2).*cos(h.^2))./pa.^2 ...
        +2*a*ky;
end
end
