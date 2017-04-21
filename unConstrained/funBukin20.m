%% Bukin 20's function
%L. LAURENT -- 01/11/2016 -- luc.laurent@lecnam.net
%



function [p,dp]=funBukin20(xx)

%constants
a=1000;
b=5;
c=9;
d=0.1;
e=4;
f=6;

%evaluation and derivatives
pa=xx(:,:,2)-b*xx(:,:,1)-c;
pb=e*xx(:,:,2)+xx(:,:,1)+f;
p=a*pa.^2+d*pb.^2;
if nargout==2
    dp(:,:,1)=-2*a*b*pa+2*d*pb;
    dp(:,:,2)=2*a*pa+2*d*e*pb;   
end
end

