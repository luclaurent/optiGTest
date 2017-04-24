%% Bukin 4's function
%L. LAURENT -- 01/11/2016 -- luc.laurent@lecnam.net
%



function [p,dp]=funBukin04(xx)

%constants
a=100;
b=0.01;
c=10;

%evaluation and derivatives
pa=xx(:,:,1)+c;
p=a*xx(:,:,2).^2+b*abs(pa);
if nargout==2
    dp(:,:,1)=b*sign(pa);
    dp(:,:,2)=2*a*xx(:,:,2);   
end
end
