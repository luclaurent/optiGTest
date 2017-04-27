%% Mishra 4 function
%L. LAURENT -- 17/11/2016 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=--0.1971881 for x=(-9.94112, -9.99952)
%
%Design space: -10<xi<10


function [p,dp]=funMishra04(xx)

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
p=sqrt(abs(sin(pd)))+a*pb;

if nargout==2
    dp(:,:,1)=0.5*xxx./pd...
        .*cos(pd)...
        .*sign(sin(pd))...
        .*sign(pa)...
        ./sqrt(abs(sin(pd)))...
        +a;
    dp(:,:,2)=0.25./pd...
        .*cos(pd)...
        .*sign(sin(pd))...
        .*sign(pa)...
        ./sqrt(abs(sin(pd)))...
        +a;
end
end
