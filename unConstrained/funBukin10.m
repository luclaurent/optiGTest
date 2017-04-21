%% Bukin 10's function
%L. LAURENT -- 01/11/2016 -- luc.laurent@lecnam.net
%



function [p,dp]=funBukin10(xx)

%constants
a=1000;
b=20;
c=270;
d=3;
e=30;

%evaluation and derivatives
pa=xx(:,:,1).^2+b*abs(xx(:,:,1))+xx(:,:,2).^2-c;
pb=d*xx(:,:,1)+xx(:,:,2)+e;
p=a*pa.^2+abs(pb);
if nargout==2
    dp(:,:,1)=2*a.*(2*xx(:,:,1)+b*sign(xx(:,:,1))).*pa+d*sign(pb);
    dp(:,:,2)=4*a.*xx(:,:,2).*pa+sign(pb);   
end
end
