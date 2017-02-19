%% Schwefel 4 function
% L. LAURENT -- 19/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(0,...,0)=0
%
%Design space 0<xi<10


function [p,dp] = funSchwefel04(xx)

%constants
a=1;

%evaluation and derivatives
x1=xx(:,:,1);
pa=xx-a;
pb=x1-xx.^2;
%
p=sum(pa.^2+pb.^2,3);

if nargout==2
    %
    dp=zeros(size(xx));
    %
    dp(:,:,1)=2*(x1-a) ...
        + 2*(1-2*x1).*(x1-x1.^2) ...
        + 2*sum(pb(:,:,2:end),3);
    dp(:,:,2:end)=2*pa(:,:,2:end) ...
        - 4*xx(:,:,2:end).*pb(:,:,2:end);
end
end
