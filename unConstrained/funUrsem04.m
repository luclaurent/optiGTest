%% Ursem 4 function
% L. LAURENT -- 24/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(0,0)=-1,5
%
%Design space -2<xi<2

function [p,dp] = funUrsem04(xx)

%constants
a=3;
b=pi/2;
c=pi/2;
d=2;
e=4;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
%
sxy=sqrt(x.^2+y.^2);
%
pa=-a*sin(b*x+c);
pb=(d-sxy)./e;
%
pt=pa.*pb;
%
p=sum(pt,3);

if nargout==2
    %
    dp=zeros(size(xx));
    %
    dp(:,:,1)=-a*b*cos(b*x+c).*pb-pa.*x./(e*sxy);
    dp(:,:,2)=-pa.*y./(e*sxy);
end
end

