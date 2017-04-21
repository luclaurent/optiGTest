%% Bukin 14's function
%L. LAURENT -- 01/11/2016 -- luc.laurent@lecnam.net
%



function [p,dp]=funBukin14(xx)

%constants
a=1000;
b=1e-3;
c=11;

%evaluation and derivatives
pa=xx(:,:,2)-b*xx(:,:,1).^3;
pb=xx(:,:,2)+xx(:,:,1)+c;
p=a*abs(pa)+abs(pb);
if nargout==2
    dp(:,:,1)=-3*a*b*xx(:,:,1).^2.*sign(pa)+sign(pb);
    dp(:,:,2)=a*sign(pa)+sign(pb);   
end
end

