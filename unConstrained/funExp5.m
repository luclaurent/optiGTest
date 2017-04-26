%% Exp5 function
%L. LAURENT -- 26/04/2017 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=0 for x=[1 10 1 5 4]
%
%Design space: 0<xi<20
%



function [p,dp]=funExp5(xx)
%constants
a=10;
b=5;
c=11;
d=3;
f=4;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
z=xx(:,:,3);
v=xx(:,:,4);
w=xx(:,:,5);
%
listI=reshape(1:c,1,1,c);
pa=exp(-listI.*x./a);
pb=-exp(-listI.*y./a);
pc=-exp(-listI./a);
pd=b*exp(-listI);
pe=d*exp(-listI.*w./a);
pf=-d*exp(-listI.*f./a);
%
pt=z.*pa+v.*pb+pc+pd+pe+pf;
p=sum(pt.^2,3);

%
if nargout==2
    %
    dp=zeros(size(xx));
    %
    dp(:,:,1)=2*z.*sum(-listI./a.*pa.*pt,3);
    dp(:,:,2)=2*v.*sum(-listI/a.*pb.*pt,3);
    dp(:,:,3)=2*sum(pa.*pt,3);
    dp(:,:,4)=2*sum(pb.*pt,3);
    dp(:,:,5)=2*sum(-listI/a.*pe.*pt,3);
end
end
