%% Helical Valley function
%L. LAURENT -- 17/11/2016 -- luc.laurent@lecnam.net
%
%global minimum : f(x1,x2,x3)=0 for (x1,x2,x3)=(1,0,0)
%
%Design space: -10<xi<10


function [p,dp]=funHelicalValley(xx)
%constants
a=100;
b=10;
c=1;
d=1/(2*pi);

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);
zzz=xx(:,:,3);

%evaluation and derivatives
th=atan2(yyy,xxx)*d;
pa=yyy-b*th;
pb=sqrt(xxx.^2+yyy.^2)-c;
%
p=a*(pa.^2+pb.^2)+zzz.^2;

if nargout==2
    dthX=-d*yyy./(xxx.^2+yyy.^2);
    dthY=d.*xxx./(xxx.^2+yyy.^2);
    pbX=2*a*xxx./sqrt(xxx.^2+yyy.^2).*pb;
    pbY=2*a*yyy./sqrt(xxx.^2+yyy.^2).*pb;
    paX=-2*a*b*dthX.*pa;
    paY=2*a*(1-b*dthY).*pa;
    %
    dp(:,:,1)=paX+pbX;
    dp(:,:,2)=paY+pbY;  
    dp(:,:,3)=2*zzz;
end
end
