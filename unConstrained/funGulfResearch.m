%% Gulf Research function
%L. LAURENT -- 16/11/2016 -- luc.laurent@lecnam.net
%
%global minimum : f(x1,x2)=0 for (50,25,1.5)
%
%Design space: 0<xi<60

function [p,dp]=funGulfResearch(xx)

%constants
a=99;
b=25;
c=50;
d=0.001;
e=1/1.5;
%
u=reshape(b+(-c*log(d.*(1:a))).^e,1,1,a);
t=reshape(d*(1:a),1,1,a);

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);
zzz=xx(:,:,3);

%evaluation and derivatives
pa=bsxfun(@minus,u,yyy);
pb=bsxfun(@power,pa,zzz);
pc=bsxfun(@times,pb,1./xxx);
pd=bsxfun(@plus,pc,t);
%
p=sum(exp(-pd),3);
%
if nargout==2
    pe=bsxfun(@times,pb,1./xxx.^2);
    pf=bsxfun(@power,pa,zzz-1);
    pg=bsxfun(@times,pf,zzz./xxx);
    ph=bsxfun(@times,log(pa),1./xxx);
    %
    dp(:,:,1)=sum(pe.*pd,3);
    dp(:,:,2)=sum(pg.*pd,3);
    dp(:,:,3)=sum(-ph.*pb.*pd,3);
end
end