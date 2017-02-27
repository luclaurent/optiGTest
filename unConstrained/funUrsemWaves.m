%% Ursem Waves function
% L. LAURENT -- 24/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(1.2,1.2)=-8.5536
%
%Design space -2<xi<2

function [p,dp] = funUrsemWaves(xx)

%constants
a=0.9;
b=4.5;
c=4.7;
d=2;
e=2.5*pi;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
%
xyA=y.^2-b*y.^2;
xyB=d*x-y.^2.*(d+x);
cdxy=c*cos(xyB);
se=sin(e*x);
%
p=-a*x.^2 ...
    +xyA.*x.*y ...
    +cdxy.*se;

if nargout==2
    %
    dp=zeros(size(xx));
    %
    sdxy=sin(xyB);
    %
    dp(:,:,1)=-2*a*x+xyA.*y ...
        -c*(d-y.^2).*sdxy.*se ...
        +e*cdxy.*cos(e*x);
    dp(:,:,2)=(1-b)*3*x.*y.^2 ...
        +2*c*y.*(d+x).*sdxy.*se;
end
end

