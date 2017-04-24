%% Price 1 function
%L. LAURENT -- 17/11/2016 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=0 for x={(?5,?5),(?5,5),(5,?5),(5,5)}
%
%Design space: -500<xi<500


function [p,dp]=funPrice01(xx)

%constants
a=5;

%evaluation and derivatives
%
xa=abs(xx)-a;
p=sum(xa.^2,3);

if nargout==2
    dp=2*sign(xx).*xa;
end
end
