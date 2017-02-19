%% Schwefel 21 function
% L. LAURENT -- 19/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(0,...,0)=0
%
%Design space -100<xi<100


function [p,dp] = funSchwefel21(xx)

%evaluation and derivatives
pa=abs(xx);
%
if nargout==1
    p=max(pa,[],3);
else
    [p,Ip]=max(pa,[],3);
end


if nargout==2
    %
    dpTmp=sign(xx);
    %
    %compute linear index
    sX=size(xx);
    rowSub=(1:sX(1))';
    colSub=1:sX(2);
    LI=sub2ind(sX,rowSub(:,ones(1,sX(2))),colSub(ones(1,sX(1)),:),Ip);
    %
    dp=zeros(sX);
    dp(LI)=dpTmp(LI);
end
end
