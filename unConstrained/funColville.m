%% Colville function
%L. LAURENT -- 16/09/2011 -- luc.laurent@lecnam.net
%
%global minimum : f(x1,x2,x3,x4)=0 for (x1,x2,x3,x4)=(1,1,1,1)
%
%Design space: -10<xi<10


function [p,dp]=funColville(xx)

%constants
a=100;
b=1;
c=90;
d=10.1;
e=19.8;

%evaluation and derivatives
pa=xx(:,:,1)-xx(:,:,2).^2;
pb=b-xx(:,:,1);
pc=xx(:,:,4)-xx(:,:,3).^2;
pd=b-xx(:,:,3);
pe=xx(:,:,2)-b;
pf=xx(:,:,4)-b;
%
p=a*pa.^2+pb+c*pc.^2+pd.^2+d*pe.^2+d*pf.^2+e*pe.*pf;
%
if nargout==2
    dp(:,:,1)=2*a*pa-2*pb;
    dp(:,:,2)=-4*a*xx(:,:,2).*pa+2*d*pe+e*pf;
    dp(:,:,3)=-2*xx(:,:,3).*pc-2*pd;
    dp(:,:,4)=2*c*pc+2*d*pf+e*pe;
end
end