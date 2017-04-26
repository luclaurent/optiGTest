%% Exp4 function
%L. LAURENT -- 26/04/2017 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=0 for x=[1 10 1 5]
%
%Design space: 0<xi<20
%



function [p,dp]=funExp4(xx)
%constants
a=10;
b=5;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
z=xx(:,:,3);
v=xx(:,:,4);
%
listI=reshape(1:a,1,1,a);
pa=exp(-listI.*x./a);
pb=-exp(-listI.*y./a);
pc=-exp(-listI./a);
pd=b*exp(-listI);
%
pt=z.*pa+v.*pb+pc+pd;
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
end
end
