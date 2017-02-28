%% Venter-Sobiezcczanski-Sobieski function
% L. LAURENT -- 27/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(0,0)=-400
%
%Design space -50<xi<50

function [p,dp] = funVenterSobiezcczanskiSobieski(xx)

%constants
a=100;
c=30;

%evaluation and derivatives
%
cx=cos(xx);
ccx=cos(xx.^2./c);
%
pA=xx.^2-a*cx.^2-a*ccx;
%
p=sum(pA,3);

if nargout==2
    %
    sx=sin(xx);
    scx=sin(xx.^2./c);
    %
    dp=2*xx+2*a*cx.*sx+2*a/c*xx.*scx;
end
end

