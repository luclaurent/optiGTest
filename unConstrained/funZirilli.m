%% Zirilli function
% L. LAURENT -- 28/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(-1.0465,0)=-0.3523
%
%Design space -10<xi<10

function [p,dp] = funZirilli(xx)

%constants
a=1/4;
b=1/2;
c=0.1;
d=1/2;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
%
p=a*x.^4-b*x.^2+c*x+d*y.^2;

if nargout==2   
    dp=zeros(size(xx));
    %
    dp(:,:,1)=4*a*x.^3-2*b*x+c;
    dp(:,:,2)=2*d*y;
end
end

