%% Rump function
% L. LAURENT -- 14/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(0,0)=0
%
%Design space -500<xi<500


function [p,dp] = funRump(xx)

%constants
a=333.75;
b=11;
c=121;
d=2;
e=5.5;
f=2;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
p=(a-x.^2).*y.^6 ...
    +x.^2.*(b*x.^2.*y.^2-c*y.^4-d) ...
    +e*y.^8+x./(f*y);

if nargout==2
    %
    dp=zeros(size(xx));
    dp(:,:,1)=-2*x.*y.^6 ...
        +2*x.*(b*x.^2.*y.^2-c*y.^4-d) ...
        +2*b*x.^3.*y.^2 ...
        +1./(f*y);
    dp(:,:,2)=6*y.^5.*(a-x.^2) ...
        +x.^2.*(2*b*x.^2.*y-4*c*y.^3) ...
        +8*e*y.^7 ...
        -x./(f*y.^2);
end
end
