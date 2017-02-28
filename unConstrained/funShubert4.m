%% Shubert 4 function
% L. LAURENT -- 19/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(-0.80032121,-7.08350592)=-29.016015
%
%Design space -10<xi<10


function [p,dp] = funShubert4(xx)

%constants
a=5;

%evaluation and derivatives
sX=size(xx);
%
lI=1:a;
lI=reshape(lI,1,1,[]);
lI=lI(ones(1,sX(1)),ones(1,sX(2)),:);
%
fun=@(I,X)I.*cos((I+1).*X+I);
%
p=zeros(sX(1),sX(2));
%
for itX=1:sX(3)
    h=fun(lI,xx(:,:,itX));
    p=p+sum(h,3);
end

if nargout==2
    %
    dp=zeros(sX);
    funD=@(I,X)-I.*(I+1).*sin((I+1).*X+I);
    %
    for itX=1:sX(3)
        dh=funD(lI,xx(:,:,itX));
        dp(:,:,itX)=sum(dh,3);
    end
end
end
