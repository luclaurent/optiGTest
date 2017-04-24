%% New Function 2 function
%L. LAURENT -- 21/03/2017 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=-0.1971881059905 for x=[-9.94112 -9.99952]
%
%Design space: -10<xi<10
%


function [p,dp]=funNewFunction02(xx)
%constants
a=100;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
%
xy=x.^2+y;
axy=abs(xy);
sqxy=sqrt(axy);
sa=sin(sqxy);
%
pb=(x+y)./a;
%
p=abs(sa).^(1/2)+pb;
%
if nargout==2
    %
    dp=zeros(size(xx));
    %
    ca=cos(sqxy);
    %
    dp(:,:,1)=1/2*x.*sign(xy)./sqxy.*ca.*sign(sa).*abs(sa).^(-1/2)+1/a;
    dp(:,:,2)=1/4.*sign(xy)./sqxy.*ca.*sign(sa).*abs(sa).^(-1/2)+1/a;
    %
end
