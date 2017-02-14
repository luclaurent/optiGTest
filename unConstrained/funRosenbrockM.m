%% Modified Rosenbrock function
% L. LAURENT -- 14/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(-1,-1)=0
%
%Design space -2<xi<2


function [p,dp] = funRosenbrockM(xx)

%constants
a=74;
b=100;
c=1;
d=400;
e=0.1;

%evaluation and derivatives
pa=(xx+c).^2./e;
calA=d*exp(-sum(pa,3));

%
p=a+b*(xx(:,:,2)-xx(:,:,1).^2).^2+(c-xx(:,:,1)).^2-calA;

if nargout==2
    %
    dp=zeros(size(xx));
    dp(:,:,1)=-4*b*xx(:,:,1).*(xx(:,:,2)-xx(:,:,1).^2)...
        -2*(c-xx(:,:,1))+...
        2/e*(xx(:,:,1)+c).*calA;
    dp(:,:,2)=2*b*(xx(:,:,2)-xx(:,:,1).^2)...
        +2/e*(xx(:,:,2)+c).*calA;
end
end
