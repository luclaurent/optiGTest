%% New Function 1 function
%L. LAURENT -- 20/03/2017 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=-0.17894509347721144 for x=[-8.4666,-9.9988]
%
%Design space: -10<xi<10
%


function [p,dp]=funNewFunction1(xx)
%constants
a=100;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
%
xy=x.^2+y;
axy=abs(xy);
sqxy=sqrt(axy);
ca=cos(sqxy);
%
pb=(x+y)./a;
%
p=abs(ca).^(1/2)+pb;
%
if nargout==2
    %
    dp=zeros(size(xx));
    %
    sa=sin(sqxy);
    %
    dp(:,:,1)=-1/2*x.*sign(xy)./sqxy.*sa.*sign(ca).*abs(ca).^(-1/2)+1/a;
    dp(:,:,2)=-1/4.*sign(xy)./sqxy.*sa.*sign(ca).*abs(ca).^(-1/2)+1/a;
    %
end
