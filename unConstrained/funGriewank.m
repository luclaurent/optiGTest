%% Griewank function
%L. LAURENT -- 16/11/2016 -- luc.laurent@lecnam.net
%
%global minimum : f(x1,x2)=0 for (0,...,0)
%
%Design space: -100<xi<100

function [p,dp]=funGriewank(xx)

%constants
a=1/4000;
b=1;

%evaluation and derivatives
dim=size(xx,3);
div=sqrt(reshape(1:dim,1,1,dim));
pa=bsxfun(@times,xx,1./div);
p=a*sum(xx.^2,3)-prod(cos(pa),3)+b;
%
if nargout==2
    funP=@(i)prod(cos(pa(:,:,[1:i-1 i+1:end])),3);
    pb=arrayfun(funP,1:dim,'UniformOutput',false);
    pb=cell2mat(reshape(pb,1,1,dim));
    %
    dp=2*a*xx...
        +bsxfun(@times,sin(pa),1./div).*pb;
end
end