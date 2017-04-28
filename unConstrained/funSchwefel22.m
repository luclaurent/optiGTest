%% Schwefel 22 function
% L. LAURENT -- 19/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(0,...,0)=0
%
%Design space -100<xi<100


function [p,dp] = funSchwefel22(xx)

dim=size(xx,3);

%evaluation and derivatives
pa=abs(xx);
%
p=sum(pa,3)+prod(pa,3);


if nargout==2
    %
    funP=@(i)prod(pa(:,:,[1:i-1 i+1:end]),3);
    pd=arrayfun(funP,1:dim,'UniformOutput',false);
    pd=cell2mat(reshape(pd,1,1,dim));
    %
    dp=sign(xx).*(1+pd);
    
    %sx=sign(xx);
    
    %
    %dp=2/dim.*bsxfun(@times,sx,pc).*(1-bsxfun(@times,pd,pb.^(1/dim-1)));
end
end
