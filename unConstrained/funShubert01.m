%% Shubert 1 function
% L. LAURENT -- 19/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(7.0835,4.8580)=-186.7309
%
%Design space -10<xi<10


function [p,dp] = funShubert01(xx)

%constants
a=5;

%evaluation and derivatives
sX=size(xx);
da=ones(1,a);
x=xx(:,:,1);x=x(:,:,da);
y=xx(:,:,2);y=y(:,:,da);
lI=1:a;
lI=reshape(lI,1,1,[]);
lI=lI(ones(1,sX(1)),ones(1,sX(2)),:);
%
fun=@(I,X)I.*cos((I+1).*X+I);
%
h=fun(lI,x);
g=fun(lI,y);
%
p=sum(h,3).*sum(g,3);

if nargout==2
    %
    dp=zeros(sX);
    funD=@(I,X)-I.*(I+1).*sin((I+1).*X+I);
    %
    dH=funD(lI,x);
    dG=funD(lI,y);
    %
    dp(:,:,1)=sum(dH,3).*sum(g,3);
    dp(:,:,2)=sum(h,3).*sum(dG,3);
end
end
