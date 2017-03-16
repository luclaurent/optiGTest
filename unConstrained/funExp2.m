%% Exp2 function
%L. LAURENT -- 16/03/2017 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=0 for x=[1 0.1]
%
%Design space: 0<xi<20
%



function [p,dp]=funExp2(xx)
%constants
m=9;
a=10;
b=5;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
%
listI=reshape(1:m,1,1,m);
pa=exp(-listI.*x./a);
pb=-b*exp(-listI.*y./a);
pc=-exp(-listI./a);
pd=b*exp(-listI);
%
pt=pa+pb+pc+pd;
p=sum(pt.^2,3);

%
if nargout==2
    %
    dp=zeros(size(xx));
    %
    dp(:,:,1)=2*sum(-listI./a.*pa.*pt,3);
    dp(:,:,2)=2*sum(-listI./a.*pb.*pt,3);
end
end
