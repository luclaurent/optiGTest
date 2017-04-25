%% Damavandi's function
%L. LAURENT -- 05/11/2016 -- luc.laurent@lecnam.net
%
%1 global minimum : f(2,2)=0 
%
%Design space: 0<xi<14


function [p,dp]=funDamavandi(xx)

%constants
a=1;
b=pi;
c=2;
d=7;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
pax=xxx-c;
pay=yyy-c;
sx=sin(b*pax);
sy=sin(b*pay);
kxy=sx.*sy./(b^2*pax.*pay);
%
pbx=xxx-d;
pby=yyy-d;
hxy=c+pbx.^2+c*pby.^2;
%
p=(a-abs(kxy).^5).*hxy;
%
if nargout==2
    cx=cos(b*pax);
    cy=cos(b*pay);
    %
    dkx=b*cx.*sy./(b^2*pax.*pay)+b^2*pax.*kxy./(b^2*pax.*pay);
    dky=b*cy.*sx./(b^2*pax.*pay)+b^2*pbx.*kxy./(b^2*pax.*pay);
    %
    dhx=2*pbx;
    dhy=2*c*pby;
    %
    dp(:,:,1)=dhx.*(a-abs(kxy).^5)-5*dkx.*sign(kxy).*kxy.^4.*hxy;
    dp(:,:,2)=dhy.*(a-abs(kxy).^5)-5*dky.*sign(kxy).*kxy.^4.*hxy;
end
end