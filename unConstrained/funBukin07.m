%% Bukin 7's function
%L. LAURENT -- 01/11/2016 -- luc.laurent@lecnam.net
%



function [p,dp]=funBukin7(xx)

%constants
a=100;
b=25;
c=5;
d=exp(5);

%evaluation and derivatives
pa=b+xx(:,:,1).*xx(:,:,2);
spa=sqrt(abs(pa));
pb=xx(:,:,1)+exp(xx(:,:,2))-d+c;
spb=sqrt(abs(pb));
p=a*spa+a*spb;
if nargout==2
    dp(:,:,1)=a*sign(pa).*xx(:,:,2)./(2*spa)+a*sign(pb)./(2*spb);
    dp(:,:,2)=a*sign(pa).*xx(:,:,1)./(2*spa)+a*sign(pb).*exp(xx(:,:,2))./(2*spb);   
end
end
