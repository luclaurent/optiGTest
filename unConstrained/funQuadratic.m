%% Quadratic function
%L. LAURENT -- 19/11/2016 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=-3873.7243 for x=(0.19388,0.48513)
%
%Design space: -10<xi<10


function [p,dp]=funQuadratic(xx)

%constants
a=-3803.84;
b=-138.08;
c=-232.92;
d=128.08;
e=203.64;
f=182.25;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
p=a+b*xxx+c*yyy+d*xxx.^2+e*yyy.^2+f*xxx.*yyy;

if nargout==2
    dp(:,:,1)=b+2*d*xxx+f*yyy;
    dp(:,:,2)=c+2*e*yyy+f*xxx;
end
end
