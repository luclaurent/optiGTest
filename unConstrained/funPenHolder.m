%% Pen Holder function
%L. LAURENT -- 17/11/2016 -- luc.laurent@lecnam.net
%
%4 global minimas : f(x)=-1.037845 for x=[9.646167708023526, 9.646167671043401;
%-9.646167708023526, 9.646167671043401;
%9.646167708023526, -9.646167671043401;
%-9.646167708023526, -9.646167671043401];
%
%Design space: -11<xi<11


function [p,dp]=funPenHolder(xx)

%constants
a=1;
b=pi;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
sxy=a-sqrt(xxx.^2+yyy.^2)/b;
g=exp(abs(sxy));
h=cos(xxx).*cos(yyy);
%
p=-exp(abs(g.*h).^(-1));

if nargout==2
    dgX=-1/b*sign(sxy).*xxx./sqrt(xxx.^2+yyy.^2).*g;
    dgY=-1/b*sign(sxy).*yyy./sqrt(xxx.^2+yyy.^2).*g;
    dhX=-cos(yyy).*sin(xxx);
    dhY=-sin(yyy).*cos(xxx);
    %
    dp(:,:,1)=-sign(g.*h).*(g.*h).^(-2)...
        .*(dgX.*h+dhX.*g).*p;
    dp(:,:,2)=-sign(g.*h).*(g.*h).^(-2)...
        .*(dgY.*h+dhY.*g).*p;
end
end
