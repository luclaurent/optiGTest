%% Bukin 2's function
%L. LAURENT -- 01/11/2016 -- luc.laurent@lecnam.net
%



function [p,dp]=funBukin2(xx)

%constants
a=100;
b=0.01;
c=1;
d=10;

%evaluation and derivatives
p=a*(xx(:,:,2)-b*xx(:,:,1).^2+c).^2+b*(xx(:,:,1)+d).^2;
if nargout==2
    dp(:,:,1)=2*b*(xx(:,:,1)+d)-a*b*2*xx(:,:,1).*(xx(:,:,2)-b*xx(:,:,1).^2+c);
    dp(:,:,2)=2*a*(xx(:,:,2)-b*xx(:,:,1).^2+c);    
end
end
