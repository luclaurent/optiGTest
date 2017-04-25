%% Deceptive function 
%L. LAURENT -- 14/03/2017 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=-1 for xi=alphai=i/(dim+1)
%
%Design space: 0<xi<10


function [p,dp]=funDeceptive(xx)
%constants
a=4/5;
b=5;
c=4;
d=1;
beta=2;

%evaluation and derivatives
sX=[size(xx,1) size(xx,2) size(xx,3)]; 
%
alpha=(1:sX(3))./(sX(3)+1);
alphaR=repmat(reshape(alpha,1,1,sX(3)),sX(1),sX(2),1);
%
la=zeros(sX);
ua=a*alphaR;
IXa=find(xx>=la&xx<ua);
%
lb=ua;
ub=alphaR;
IXb=find(xx>=lb&xx<ub);
%
lc=ub;
uc=1/b+a*alphaR;
IXc=find(xx>=lc&xx<uc);
%
ld=uc;
ud=d*ones(sX);
IXd=find(xx>=ld&xx<=ud);
%
g=zeros(sX);
g(IXa)=a-xx(IXa)./alphaR(IXa);
g(IXb)=b*xx(IXb)./alphaR(IXb)-c;
g(IXc)=b*(xx(IXc)-alphaR(IXc))./(alphaR(IXc)-d)+d;
g(IXd)=(xx(IXd)-d)./(d-alphaR(IXd))+a;
%
pa=sum(g,3);
%
p=-(1/sX(3)*pa).^beta;
%
        
%keyboard
%
if nargout==2
    %
    dg=zeros(sX);
    %
    dg(IXa)=-1./alphaR(IXa);
    dg(IXb)=-b./alphaR(IXb);
    dg(IXc)=b./(alphaR(IXc)-d);
    dg(IXd)=1./(d-alphaR(IXd));
    %
    dp=-beta./sX(3).*dg.*1/sX(3).*pa(:,:,ones(1,sX(3)));   
end
end
