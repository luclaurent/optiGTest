%% Sphere function
% L. LAURENT -- 16/09/2011 -- luc.laurent@lecnam.net
%
%global minimum : f(xi)=0 pour (x1,x2,x3,x4)=(0,...,0)
%Design space: -1<xi<1


function [p,dp] = funSphere(xx)

%evaluation and derivatives
pX=xx.^2;
%
p=sum(pX,3);

if nargout==2
    %
    dp=2*xx;
end
end
