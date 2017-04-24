%% Bukin 9's function
%L. LAURENT -- 01/11/2016 -- luc.laurent@lecnam.net
%



function [p,dp]=funBukin9(xx)

%constants
a=1000;
b=5;
c=9;

%evaluation and derivatives
pa=xx(:,:,1)-b*xx(:,:,2)-xx(:,:,2).^2;
pb=xx(:,:,2)+xx(:,:,1)+c;
p=a*pa.^2+abs(pb);
if nargout==2
    dp(:,:,1)=2*a.*pa+sign(pb);
    dp(:,:,2)=2*a*(-b-2*xx(:,:,2)).*pa+sign(pb);   
end
end
