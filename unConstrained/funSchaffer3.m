%% Schaffer 3 function
% L. LAURENT -- 15/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(0,1.253115)=0.00123005
%
%Design space -100<xi<100


function [p,dp] = funSchaffer3(xx)

%constants
a=0.5;
b=1;
c=0.001;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
xay=x.^2+y.^2;
xmy=x.^2-y.^2;
cxy=cos(abs(xmy));
scxy=sin(cxy);
pa=scxy.^2-a;
pb=b+c*xay.^2;
%
p=a+pa./pb;

if nargout==2
    %
    dpT=-2*xx.*sign(xmy).*sin(abs(xmy)).*2.*cos(cxy).*scxy;
    dpax=dpT(:,:,1);
    dpay=-dpT(:,:,2);
    dpbx=4*c*x.*xay;
    dpby=4*c*y.*xay;
    dp(:,:,1)=(dpax.*pb-pa.*dpbx)./pb.^2;
    dp(:,:,2)=(dpay.*pb-pa.*dpby)./pb.^2;
end
end
