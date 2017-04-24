%% Bukin 5's function
%L. LAURENT -- 01/11/2016 -- luc.laurent@lecnam.net
%



function [p,dp]=funBukin5(xx)

%constants
a=100;
b=10;
c=0.01;

%evaluation and derivatives
pa=xx(:,:,1)+b;
p=c*xx(:,:,2).^2+a*abs(pa);
if nargout==2
    dp(:,:,1)=a*sign(pa);
    dp(:,:,2)=2*c*xx(:,:,2);   
end
end
