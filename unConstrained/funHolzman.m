%% Holzman function
%L. LAURENT -- 16/03/2017 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=0 for x=[50 25 1.5]
%
%Design space: 0<x1<100, 0<x2<25.6, 0<x3<5
%



function [p,dp]=funHolzman(xx)
%constants
a=0.1;
c=25;
d=50;
e=2/3;
f=1e-2;
m=100;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
z=xx(:,:,3);
%
listI=reshape(1:m,1,1,m);
u=c+(-d.*log(f*listI)).^e;
%
pa=(u-y);
pax=pa.^z;
paxx=pax./x;
pb=exp(paxx)-a*listI;
%
p=sum(pb,3);

%
if nargout==2
    %
    dp=zeros(size(xx));
    %
    dp(:,:,1)=sum(-paxx./x.*exp(paxx),3);
    dp(:,:,2)=sum(-z.*pa.^(z-1)./x.*exp(paxx),3);
    dp(:,:,3)=sum(log(pa).*paxx.*exp(paxx),3);
end
end
