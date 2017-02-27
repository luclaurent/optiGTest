%% Tripod function
% L. LAURENT -- 24/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(0,-50)=0
%
%Design space -100<xi<100


function [p,dp] = funTripod(xx)

%constants
a=1;
b=50;
c=2;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
%
pX=ps(x);
pY=ps(y);
%
pa=pY.*(a+pX);
pb=x+b*pY.*(a-c*pX);
pc=y+b*(a-c*pY);
%
p=pa+abs(pb)+abs(pc);

if nargout==2
    %
    dp=zeros(size(xx));
    %
    dpX=dps(x);
    dpY=dps(y);
    %
    dp(:,:,1)=pY.*dpX+sign(pb).*(1-b*c*pY.*dpX);
    dp(:,:,2)=(a+pX).*dpY ... 
        +b*sign(pb).*dpY.*(a-c*pX) ...
        +sign(pc).*(1-b*c*dpY);      
end
end

function ev=ps(x)
    ev=ones(size(x));
    IX=(x<0);
    ev(IX)=0;
end

function ev=dps(x)
    ev=zeros(size(x));
    IX=(x==0);
    ev(IX)=1/eps;
end