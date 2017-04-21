%% Bukin 15's function
%L. LAURENT -- 01/11/2016 -- luc.laurent@lecnam.net
%



function [p,dp]=funBukin15(xx)

%constants
a=1000;
b=10;
c=25;
d=0.1;
e=75;


%evaluation and derivatives
pa=xx(:,:,2)+xx(:,:,1).^2+b*xx(:,:,1)-c;
pb=xx(:,:,2)+b*xx(:,:,1)+e;
p=a*abs(pa)+d*abs(pb);
if nargout==2
    dp(:,:,1)=a*(2*xx(:,:,1)+b).*sign(pa)+d*b*sign(pb);
    dp(:,:,2)=a*sign(pa)+d*sign(pb);   
end
end

