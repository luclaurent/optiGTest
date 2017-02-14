%% Rosenbrock function
% L. LAURENT -- 12/05/2010 -- luc.laurent@lecnam.net

%1 minimum global: f(1,...,1)=0
%
%Design space -30<xi<30

function [p,dp] = funRosenbrock(xx)

%constants
a=100;
b=1;

%evaluation and derivatives
pa=xx(:,:,2:end)-xx(:,:,1:end-1).^2;
pb=xx(:,:,1:end-1)-b;
cal=a*pa.^2+pb.^2;
%
p=sum(cal,3);

if nargout==2
    dgi=-4*a*pa.*xx(:,:,1:end-1)...
        +2*pb;
    %
    dp=zeros(size(xx)); dpp=zeros(size(xx));
    dp(:,:,1)=dgi(:,:,1);
    dp(:,:,2:end-1)=dgi(:,:,2:end)+2*a*pa(:,:,1:end-1);
    dp(:,:,end)=2*a*pa(:,:,end);
end
end
