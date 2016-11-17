%% Mishra 11 function
%L. LAURENT -- 17/11/2016 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=0 for xi=0
%
%Design space: -10<xi<10


function [p,dp]=funMishra11(xx)

%evaluation and derivatives
dim=size(xx,3);
pa=sum(abs(xx),3);
pb=prod(abs(xx),3);
%
pc=1/dim*pa-(pb).^(1/dim);
p=pc.^2;

if nargout==2    
    sx=sign(xx);
    funP=@(i)prod(abs(xx(:,:,[1:i-1 i+1:end])),3);
    pd=arrayfun(funP,1:dim,'UniformOutput',false);
    pd=cell2mat(reshape(pd,1,1,dim));
    %
    dp=2/dim.*bsxfun(@times,sx,pc).*(1-bsxfun(@times,pd,pb.^(1/dim-1)));
end
end
