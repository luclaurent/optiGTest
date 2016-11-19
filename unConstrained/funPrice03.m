%% Price 3 function
%L. LAURENT -- 17/11/2016 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=0 for x={(?5,?5),(?5,5),(5,?5),(5,5)}
%
%Design space: -500<xi<500


function [p,dp]=funPrice03(xx)

%constants
a=100;
b=6;
c=6.4;
d=0.6;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
pa=yyy-xxx.^2;
pb=c*(yyy-d).^2-xxx-d;
%
p=a.*pa.^2+b*pb.^2;

if nargout==2
    dp(:,:,1)=-4*a*xxx.*pa-2*b*pb;
    dp(:,:,2)=2*a*pa+4*b*c*(yyy-d).*pb;
end
end
