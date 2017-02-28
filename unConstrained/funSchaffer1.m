%% Schaffer 1 function
% L. LAURENT -- 15/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(0,0)=0
%
%Design space -100<xi<100


function [p,dp] = funSchaffer1(xx)

%constants
a=0.5;
b=1;
c=0.001;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
xy=x.^2+y.^2;
sxy=sin(xy);
pa=sxy.^2-a;
pb=b+c*xy.^2;
%
p=a+pa./pb;

if nargout==2
    %
    dp=zeros(size(xx));
    cxy=cos(xy);
    dpax=4*x.*sxy.*cxy;
    dpay=4*y.*sxy.*cxy;
    dpbx=4*c*x.*xy;
    dpby=4*c*y.*xy;
    dp(:,:,1)=(dpax.*pb-pa.*dpbx)./pb.^2;
    dp(:,:,2)=(dpay.*pb-pa.*dpby)./pb.^2;
end
end
