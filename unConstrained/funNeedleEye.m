%% Needle Eye function
%L. LAURENT -- 20/03/2017 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=1 for xi=-1
%
%Design space: -10<xi<10
%


function [p,dp]=funNeedleEye(xx)
%constants
a=100;
b=1e-4;


%evaluation and derivatives
aX=abs(xx);
%
pa=a+aX;
%
IXa=aX<b;
IXb=aX>b;
IXAll=all(IXa,3);
%
p=sum(pa.*IXb,3);
p(IXAll)=1;

%
if nargout==2
    %
    dp=zeros(size(xx));
    %
    dp=sign(xx).*IXb;
    dp(IXAll(:,:,ones(1,size(xx,3))))=0;
    
end
