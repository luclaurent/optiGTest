%% Langermann 5 2D function
%L. LAURENT -- 17/11/2016 -- luc.laurent@lecnam.net
%
%global minimum : f(x1,x2)=-1.4 for (x1,x2)=()
%
%Design space:0<xi<10


function [p,dp]=funLangermann52(xx)
%constants
ma = [3,5,2,1,7];
mb = [5,2,1,4,9];
mc = [1,2,5,2,3];
d=pi;
m=5;
%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
vx=bsxfun(@minus,xxx,reshape(ma,1,1,m));
vy=bsxfun(@minus,yyy,reshape(mb,1,1,m));
vxy=vx.^2+vy.^2;
ex=exp(-1/d*vxy);
cx=cos(d*vxy);
cc=bsxfun(@times,cx,reshape(mc,1,1,m));
%
p=sum(-ex.*cc,3);
%
if nargout==2
    sx=sin(d*vxy);
    cs=bsxfun(@times,sx,reshape(mc,1,1,m));
    pvx=vx.*ex;
    pvy=vy.*ex;
    %        
    dp(:,:,1)=sum(2/d*pvx.*cc+2*d*pvx.*cs,3);
    dp(:,:,2)=sum(2/d*pvy.*cc+2*d*pvy.*cs,3);
end
end
