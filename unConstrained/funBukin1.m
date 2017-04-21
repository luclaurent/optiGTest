%% Bukin 1's function
%L. LAURENT -- 01/11/2016 -- luc.laurent@lecnam.net



function [p,dp]=funBukin1(xx)

%constants
a=4;
b=100;
c=6;
d=8;
e=4;

%evaluation and derivatives
pa=(xx(:,:,1)-xx(:,:,2)).^2-a;
pb=c*(xx(:,:,1).^2+xx(:,:,2).^2)+d*xx(:,:,1).*xx(:,:,2)-e;
p=(pa.^2+b*pb.^2);
if nargout==2
    dp(:,:,1)=4*(xx(:,:,1)-xx(:,:,2)).*pa...
        +2*b*(2*c*xx(:,:,1)+d*xx(:,:,2)).*pb;
    dp(:,:,2)=-4*(xx(:,:,1)-xx(:,:,2)).*pa...
        +2*b*(2*c*xx(:,:,2)+d*xx(:,:,1)).*pb;
end
end
