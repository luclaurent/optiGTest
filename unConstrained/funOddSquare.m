%% Odd Square function
%L. LAURENT -- 21/03/2017 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=-1.0084 for xi=pi
%
%Design space: -5*pi<xi<5*pi
%
%nbvar<20


function [p,dp]=funOddSquare(xx)
%constants
a=2*pi;
b=pi;
c=1;
e=0.02;
f=0.01;
BV=[1, 1.3, 0.8, -0.4, -1.3, 1.6, -0.2, -0.6, 0.5, 1.4...
    1, 1.3, 0.8, -0.4, -1.3, 1.6, -0.2, -0.6, 0.5, 1.4];
BV=reshape(BV,1,1,20);

%evaluation and derivatives
sX=[size(xx,1) size(xx,2) size(xx,3)];
%
xb=xx-BV(:,:,1:sX(3));
%
[vX,IXm]=max(xb.^2,[],3);
maxD=sX(3)*vX;
h=sum(xb.^2,3);
%
pa=exp(-maxD./a);
pb=cos(b*maxD);
pc=c+e*h./(maxD+f);
%
p=-pa.*pb.*pc;
%
if nargout==2
    %
    dD=zeros(sX);
    %
    %compute linear index
    rowSub=(1:sX(1))';
    colSub=1:sX(2);
    LI=sub2ind(sX,rowSub(:,ones(1,sX(2))),colSub(ones(1,sX(1)),:),IXm);
    %
    dD(LI)=2*sX(3).*xb(LI);
    %
    dh=2*xb;
    %
    dp=1/a*dD.*pa.*pb.*pc ...
        +b.*dD.*sin(b*maxD).*pa.*pc ...
        -e*(dh.*(maxD+f)-h.*dD)./(maxD+f).^2.*pa.*pb;
    %
    keyboard
    dp
end
