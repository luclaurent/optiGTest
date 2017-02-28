%% Zettl function
% L. LAURENT -- 28/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(-0.02896,0)=-0.0037912
%
%Design space -1<xi<5

function [p,dp] = funZettl(xx)

%constants
a=1/4;
b=2;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
%
pa=a*x;
pb=x.^2-b*x+y.^2;
%
p=pa+pb.^2;

if nargout==2   
    dp=zeros(size(xx));
    %
    dp(:,:,1)=a+2*(2*x-b).*pb;
    dp(:,:,2)=4*y.*pb;
end
end

