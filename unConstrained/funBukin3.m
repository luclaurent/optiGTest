%% Bukin 3's function
%L. LAURENT -- 01/11/2016 -- luc.laurent@lecnam.net
%



function [p,dp]=funBukin3(xx)

%constants
a=100;
b=1.5*pi;

%evaluation and derivatives
pa=(xx(:,:,2)-cos(xx(:,:,1)));
pb=xx(:,:,2)-xx(:,:,1)-b;
p=(a*pa.^2+pb.^2);
if nargout==2
    dp(:,:,1)=2*a*sin(xx(:,:,1)).*pa-2*pb;
    dp(:,:,2)=2*a*pa+2*pb;   
end
end
