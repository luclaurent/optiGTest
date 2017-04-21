%% Bukin 11's function
%L. LAURENT -- 01/11/2016 -- luc.laurent@lecnam.net
%



function [p,dp]=funBukin11(xx)

%constants
a=1000;
b=5;

%evaluation and derivatives
pa=xx(:,:,1)+b;
pb=xx(:,:,2)+b;
p=a*sin(xx(:,:,1)-xx(:,:,2)).^2+abs(pa)+abs(pb);
if nargout==2
    dp(:,:,1)=2*a*cos(xx(:,:,1)-xx(:,:,2)).*sin(xx(:,:,1)-xx(:,:,2))+2*pa;
    dp(:,:,2)=-2*a*cos(xx(:,:,1)-xx(:,:,2)).*sin(xx(:,:,1)-xx(:,:,2))+2*pb;   
end
end
