%% Yao-Liu 4 function
% L. LAURENT -- 28/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(0,...,0)=0
%
%Design space -10<xi<10

function [p,dp] = funYaoLiu04(xx)

%evaluation and derivatives
if nargout==1
    p=max(abs(xx),[],3);
else
    [p,Ip]=max(abs(xx),[],3);
end

if nargout==2   
    dp=zeros(size(xx));
    %
    signX=sign(xx);
    %
    %compute linear index
    sX=size(xx);
    rowSub=(1:sX(1))';
    colSub=1:sX(2);
    LI=sub2ind(sX,rowSub(:,ones(1,sX(2))),colSub(ones(1,sX(1)),:),Ip);
    %
    dp(LI)=signX(LI);
end
end

