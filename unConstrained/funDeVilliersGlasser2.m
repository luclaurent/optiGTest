%% deVilliers Glasser 2 function
%L. LAURENT -- 15/11/2016 -- luc.laurent@lecnam.net
%
%4 global minimas : f(x1,x2,x3,x4)=0 
%
%Design space: -500<xi<500


%derivatives check using Mathematica (a small difference remains with
%finite difference)

function [p,dp]=funDeVilliersGlasser2(xx)

%constants
a=16;
b=0.1;
c=1;
d=53.81;
f=1.27;
g=3.012;
h=2.13;
k=0.507;
%
ii=1:a;
t=reshape(b*(ii-c),[1,1,a]);
y=d*f.^t.*tanh(g*t+sin(h*t)).*cos(exp(k)*t);

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);
zzz=xx(:,:,3);
vvv=xx(:,:,4);
www=xx(:,:,5);

%evaluation and derivatives
zt=bsxfun(@times,zzz,t);
vt=bsxfun(@times,vvv,t);
wt=bsxfun(@times,exp(www),t);
%
svt=sin(vt);
%
yt=bsxfun(@power,yyy,t);
xyt=bsxfun(@times,yt,xxx);
%
pa=tanh(zt+svt);
pb=cos(wt);
pc=xyt.*pa.*pb;
pd=bsxfun(@minus,pc,y);
%
p=sum(pd.^2,3);
%
if nargout==2
    xt=bsxfun(@times,xxx,t);
    ytm=bsxfun(@power,yyy,t-1);
    cvt=cos(vt);
    pe=-sin(wt);
    %
    dp(:,:,1)=sum(2*yt.*pa.*pb.*pd,3);    
    dp(:,:,2)=sum(2*xt.*ytm.*pa.*pb.*pd,3);
    dp(:,:,3)=sum(2*xt.*yt.*(1-pa.^2).*pb.*pd,3);
    dp(:,:,4)=sum(2*xt.*yt.*cvt.*(1-pa.^2).*pb.*pd,3);
    dp(:,:,5)=sum(2*xyt.*wt.*pe.*pa.*pd,3);
end
end