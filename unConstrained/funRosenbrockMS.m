%% Modified Rosenbrock function (Sobester 2005)
% L. LAURENT -- 16/05/2012 -- luc.laurent@lecnam.net

% A. S\'obester, S. J. Leary, and A. J. Keane. On the design of optimization strategies based on global response surface approximation models. Journal of Global Optimization, 33(1):31?59, 2005.

function [p,dp] = funRosenbrockMS(xx)

%constants
a=100;
b=1;
c=75;
d=5;

%evaluation and derivatives
pa=xx(:,:,2:end)-xx(:,:,1:end-1).^2;
pb=xx(:,:,1:end-1)-b;
calA=a*pa.^2+pb.^2;
sd=sin(d*(1-xx));
calB=c*sd;
%
p=sum(calA,3)+sum(calB,3);

if nargout==2
    dgi=-4*a*pa.*xx(:,:,1:end-1)...
        +2*pb;
    dB=-c*d*cos(d*(1-xx));
    %
    dp=zeros(size(xx)); 
    dp(:,:,1)=dgi(:,:,1)+dB(:,:,1);
    dp(:,:,2:end-1)=dgi(:,:,2:end)+2*a*pa(:,:,1:end-1)+dB(:,:,2:end-1);
    dp(:,:,end)=2*a*pa(:,:,end)+dB(:,:,end);
end
end
