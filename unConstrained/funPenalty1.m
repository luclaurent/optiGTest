%% Penalty 1 function
%L. LAURENT -- 21/03/2017 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=0 for xi=-1
%
%Design space: -50<xi<50
%



function [p,dp]=funPenalty1(xx)
%constants
a=pi/30;
b=10;
c=pi;
d=1;
e=100;
f=4;

%evaluation and derivatives
y=d+1/f*(xx+d);
%
pa=sin(c*y(:,:,1));
pb=y(:,:,1:end-1)-d;
sc=sin(c*y(:,:,2:end));
pc=d+b*sc.^2;
pd=y(:,:,end)-d;
%
u=zeros(size(xx));
IXb=abs(xx)>b;
u(IXb)=e*(abs(xx(IXb))-b).^f;
%
p=a*(b*pa.^2+sum(pb.^2.*pc,3)+pd.^2)+sum(u,3);
%p=a*pd.^2;
%keyboard
%
if nargout==2
    %
    dp=zeros(size(xx));
    %
    du=zeros(size(xx));
    du(IXb)=f*e*sign(xx(IXb)).*(abs(xx(IXb))-b).^(f-1);
    %
    ppa=cos(c*y(:,:,1));
    cc=cos(c*y(:,:,2:end));
    %
    dp(:,:,1)=2*a*b*c/f.*pa.*ppa...
        +2*a/f*pb(:,:,1).*pc(:,:,1)...
        +du(:,:,1);
    dp(:,:,end)=2*a*b*c/f.*sc(:,:,end).*cc(:,:,end).*pb(:,:,end).^2 ...
        +2*a/f*pd...
        +du(:,:,end);
    dp(:,:,2:end-1)=2*a*b*c/f.*sc(:,:,1:end-1).*cc(:,:,1:end-1).*pb(:,:,1:end-1).^2 ...
        +2*a/f*pb(:,:,2:end).*pc(:,:,2:end)...
        +du(:,:,2:end-1);
end