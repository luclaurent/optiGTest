%% Hosaki function
%L. LAURENT -- 17/11/2016 -- luc.laurent@lecnam.net
%
%global minimum : f(x1,x2)=-2.3458 for (x1,x2)=(4,2)
%
%Design space: 0<xi<5


function [p,dp]=funHosaki(xx)
%constants
a=1;
b=8;
c=7;
d=7/3;
e=1/4;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
pa=a-b*xxx+c*xxx.^2-d*xxx.^3+e*xxx.^4;
pb=exp(-yyy);
%
p=pa.*yyy.^2.*pb;

if nargout==2
    dp(:,:,1)=(-b+2*c*xxx-3*d*xxx.^2+4*e*xxx.^3).*yyy.^2.*pb;
    dp(:,:,2)=pa.*pb.*(2*yyy-yyy.^2);
end
end
