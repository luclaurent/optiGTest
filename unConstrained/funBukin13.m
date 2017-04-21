%% Bukin 13's function
%L. LAURENT -- 01/11/2016 -- luc.laurent@lecnam.net
%

function [p,dp]=funBukin13(xx)

%constants
a=100;
b=3;
c=0.5;

%evaluation and derivatives
pa=xx(:,:,1)+b;
pb=xx(:,:,2)-c;
rho=sqrt(pa.^2+pb.^2);
m=sin(b*rho).*pa-cos(b*rho).*pb;
p=rho+a./rho.^2.*m.^2;
if nargout==2
    dRhoX=pa./rho;
    dRhoY=pb./rho;
    dp(:,:,1)=dRhoX-2*a./rho.^3.*dRhoX.*(m.^2)...
        +2*a./rho.^2.*(b*dRhoX.*cos(b*rho).*pa+sin(b*rho)+b*dRhoX.*sin(b*rho).*pb).*m;
    dp(:,:,2)=dRhoY-2*a./rho.^3.*dRhoY.*(m.^2)...
        +2*a./rho.^2.*(b*dRhoY.*cos(b*rho).*pa-cos(b*rho)+b*dRhoX.*sin(b*rho).*pb).*m;   
end
end

