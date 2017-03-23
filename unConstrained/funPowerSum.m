%% Power Sum function
%L. LAURENT -- 23/03/2017 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=0 for xi=[1,2,2,3]
%
%Design space: 0<xi<4
%

function [p,dp]=funPowerSum(xx)
%constants
b=[8,18,44,114];
b=reshape(b,1,1,1,4);

%evaluation and derivatives
liK=reshape(1:4,1,1,1,4);
pa=xx.^liK-b;
%
p=sum(sum(pa,3).^2,4);
%
if nargout==2
    %
    dp=sum(2*liK.*xx.^(liK-1).*sum(pa,3),4);
end