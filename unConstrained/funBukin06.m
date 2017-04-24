%% Bukin 6's function
%L. LAURENT -- 01/11/2016 -- luc.laurent@lecnam.net
%



function [p,dp]=funBukin6(xx)

%constants
a=100;
b=0.01;
c=10;

%evaluation and derivatives
pa=xx(:,:,2)-b*xx(:,:,1).^2;
spa=sqrt(abs(pa));
pb=xx(:,:,1)+c;
p=a*spa+b*abs(pb);
if nargout==2
    dp(:,:,1)=-a*b*sign(pa).*xx(:,:,1)./spa+b*sign(pb);
    dp(:,:,2)=a*sign(pa)./(2*spa);   
end
end
