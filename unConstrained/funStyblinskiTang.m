%% Styblinski Tang function
%L. LAURENT -- 23/03/2017 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=-39.16616570377142*nbvar for xi=-1.903534018185960
%
%Design space: -5<xi<5
%

function [p,dp]=funStyblinskiTang(xx)
%constants
a=16;
b=5;

%evaluation and derivatives
pa=xx.^4-a*xx.^2+b*xx;
%
p=sum(pa*1/2,3);
%
if nargout==2
    %
    dp=1/2.*(4*xx.^3-2*a*xx+b);
end