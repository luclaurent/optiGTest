%% Salomon function
% L. LAURENT -- 14/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(0,...,0)=0
%
%Design space -100<xi<100


function [p,dp] = funSalomon(xx)

%constants
a=1;
b=2*pi;
c=0.1;

%evaluation and derivatives
sumx=sum(xx.^2,3);
sqx=sqrt(sumx);
%
p=a-cos(b*sqx)+c*sqx;

if nargout==2
    %
    ds=xx./sqx;
    dp=ds.*(b*sin(b*sqx)+c);
end
end
