%% Bukin 8's function
%L. LAURENT -- 01/11/2016 -- luc.laurent@lecnam.net
%



function [p,dp]=funBukin08(xx)

%constants
a=1000;
b=800;
c=40;

%evaluation and derivatives
pa=xx(:,:,2).^2+xx(:,:,1).^2-b;
pb=xx(:,:,2)+xx(:,:,1)+c;
p=a*abs(pa)+abs(pb);
if nargout==2
    dp(:,:,1)=2*a*xx(:,:,1).*sign(pa)+sign(pb);
    dp(:,:,2)=2*a*xx(:,:,2).*sign(pa)+sign(pb); 
    xx
end
end
