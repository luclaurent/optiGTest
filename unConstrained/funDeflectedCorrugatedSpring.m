%% Deflected Corrugated Spring function
%L. LAURENT -- 16/03/2017 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=0 for xi=alpha
%
%Design space: 0<xi<2*alpha
%
%alpha=5;


function [p,dp]=funDeflectedCorrugatedSpring(xx)
%constants
K=5;
alpha=5;
a=0.1;

%evaluation and derivatives
xa=xx-alpha;
%
sxa=sum(xa.^2,3);
sqxa=sqrt(sxa);
%
p=a*sxa-cos(K*sqxa);
%

%keyboard
%
if nargout==2
    %
    dp=2*a*xa+K*xa./sqxa.*sin(K*sqxa);
end
end
