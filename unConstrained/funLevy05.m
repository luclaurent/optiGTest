%% Levy 05 function
%L. LAURENT -- 17/03/2017 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=-176.1375 for x=[-1.3068 -1.4248]
%
%Design space: -10<xi<10
%


function [p,dp]=funLevy05(xx)
%constants
m=5;
a=1.42513;
b=0.80032;


%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
%
lI=reshape(1:m,1,1,m);
%
pa=cos((lI-1).*x+lI);
pb=cos((lI+1).*y+lI);
pc=x+a;
pd=y+b;
%
p=sum(lI.*pa,3).*sum(lI.*pb,3)+pc.^2+pd.^2;

%
if nargout==2
    %
    dp=zeros(size(xx));
    %
    dp(:,:,1)=sum(-lI.*(lI-1).*sin((lI-1).*x+lI),3).*sum(lI.*pb,3)+2*pc;
    dp(:,:,2)=sum(-lI.*(lI-1).*sin((lI-1).*y+lI),3).*sum(lI.*pa,3)+2*pd;
end
end
