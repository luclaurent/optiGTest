%% Whitley function
% L. LAURENT -- 28/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(1,...,1)=0
%
%Design space -10.24<xi<10.24

function [p,dp] = funWhitley(xx)

%constants
a=100;
b=1;
c=4000;

%evaluation and derivatives
sX=size(xx);
xxi=xx;
xxj=reshape(xx,sX(1),sX(2),1,sX(3));
%
xxij=xxi.^2-xxj;
pA=a*xxij.^2+(b-xxj).^2;
pAA=pA.^2./c;
pB=cos(a*xxij.^2+(b-xxj).^2);
%
p=sum(sum(pAA-pB+b,4),3);

if nargout==2
    
    dgX=a*8/c*xxi.*xxij.*(pA+sin(a*xxij.^2+(b-xxj).^2));
    dgY=(-2*a/c*xxij-2/c*(b-xxj)).*pA ...
        -(2*a*xxij+2*(b-xxj)).*sin(a*xxij.^2+(b-xxj).^2);
    dp=sum(dgX+dgY,4);
    
end
end

