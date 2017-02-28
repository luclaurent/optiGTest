%% Weierstrass function
% L. LAURENT -- 28/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(0,...,0)=0
%
%Design space -1/2<xi<1/2

function [p,dp] = funWeierstrass(xx)

%constants
a=1/2;
b=3;
k=20;
c=2*pi;
d=1/2;
e=pi;
nbvar=size(xx,3);

%evaluation and derivatives
lik=reshape(0:k,1,1,1,[]);
%
pa=a.^lik.*cos(c*b.^lik.*(xx+d));
pb=a.^lik.*cos(e*b.^lik);
%
pAA=sum(pa,4);
pBB=sum(pb,4);
%
p=sum(pAA,3)-nbvar*pBB;

pp=zeros(size(xx,1),size(xx,2));
for itD=1:nbvar
    for itk=0:k
        pp=pp+a.^itk.*cos(c*b.^itk.*(xx(:,:,itD)-d));
    end
end
for itk=0:k
        pp=pp-nbvar*a.^itk.*cos(e*b.^itk);
end

%keyboard

if nargout==2
    dpd=zeros(size(xx));
    for itk=0:k
        dpd=dpd-a.^itk.*c.*b^itk.*sin(c*b.^itk.*(xx+d));
    end
    dp=sum(-a.^lik.*b.^lik.*c.*sin(c*b.^lik.*(xx+d)),4); 
    keyboard
end
end

