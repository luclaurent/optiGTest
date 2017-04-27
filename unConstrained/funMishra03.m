%% Mishra 3 function
%L. LAURENT -- 17/11/2016 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=-0.18467 for x=(-8.4667,-10)
%
%Design space: -10<xi<10


function [p,dp]=funMishra03(xx)

%constants
a=1e-2;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
pa=xxx.^2+yyy;
pb=xxx+yyy;
%
pc=abs(pa);
pd=sqrt(pc);
%
p=sqrt(abs(cos(pd)))+a*pb;

if nargout==2
    dp(:,:,1)=-0.5*xxx./pd...
        .*sin(pd)...
        .*sign(cos(pd))...
        .*sign(pa)...
        ./sqrt(abs(cos(pd)))...
        +a;
    dp(:,:,2)=-0.25./pd...
        .*sin(pd)...
        .*sign(cos(pd))...
        .*sign(pa)...
        ./sqrt(abs(cos(pd)))...
        +a;
end
end
