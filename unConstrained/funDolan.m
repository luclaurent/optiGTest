%% Dolan's function
%L. LAURENT -- 15/11/2016 -- luc.laurent@lecnam.net
%
%4 global minimas : f(x1,x2,x3,x4)=0 
%
%Design space: -100<xi<100


function [p,dp]=funDolan(xx)

%constants
a=1.7;
b=01.5;
c=0.1;
d=0.2;
e=1;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);
zzz=xx(:,:,3);
vvv=xx(:,:,4);
www=xx(:,:,5);

%evaluation and derivatives
pa=xxx+a*yyy;
pb=sin(xxx);
pc=b*zzz;
pd=c*vvv;
pe=cos(vvv+www-xxx);
pf=abs(d*www.^2-yyy-e);
%
p=pa.*pb-pc-pd.*pe+pf;
%
if nargout==2
    sf=sign(d*www.^2-yyy-e);
    %
    dp(:,:,1)=sf.*(cos(xxx).*pa+pb-pd.*sin(vvv+www-xxx));
    dp(:,:,2)=sf.*(a*pb-1);
    dp(:,:,3)=-sf.*b;
    dp(:,:,4)=sf.*(-c*pe+pd.*sin(vvv+www-xxx));
    dp(:,:,5)=sf.*(pd.*sin(vvv+www-xxx)+2*d*www);
end
end