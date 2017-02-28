%% Wolfe function
% L. LAURENT -- 28/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(0,0,0)=0
%
%Design space 0<xi<2

function [p,dp] = funWolfe(xx)

%constants
a=14/3;
b=0.75;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
z=xx(:,:,3);
%
p=a*(x.^2+y.^2-x.*y).^b+z;

if nargout==2
    dp=ones(size(xx));
    pb=(x.^2+y.^2-x.*y).^(b-1);
    %
    dp(:,:,1)=a*b*(2*x-y).*pb;
    dp(:,:,2)=a*b*(2*y-x).*pb;
end
end

