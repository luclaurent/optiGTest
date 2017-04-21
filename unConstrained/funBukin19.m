%% Bukin 19's function
%L. LAURENT -- 01/11/2016 -- luc.laurent@lecnam.net
%



function [p,dp]=funBukin19(xx)

%constants
a=1000;
b=10;
c=0.1;
d=62;

%evaluation and derivatives
pa=xx(:,:,2)-xx(:,:,1).^2+b;
pb=xx(:,:,2)-xx(:,:,1)-d;
p=a*abs(pa)+c*abs(pb);
if nargout==2
    dp(:,:,1)=-2*a*xx(:,:,1).*sign(pa)-c*sign(pb);
    dp(:,:,2)=a*sign(pa)+c*sign(pb);   
end
end

