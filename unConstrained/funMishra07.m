%% Mishra 7 function
%L. LAURENT -- 17/11/2016 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=0 for xi=sqrt(n)
%
%Design space: -10<xi<10


function [p,dp]=funMishra07(xx)

%evaluation and derivatives
dim=size(xx,3);
pa=xx-factorial(dim);
pb=prod(pa,3);
%
p=pb.^2;

if nargout==2    
    funP=@(i)prod(xx(:,:,[1:i-1 i+1:end]),3);
    pc=arrayfun(funP,1:dim,'UniformOutput',false);
    pc=cell2mat(reshape(pc,1,1,dim));
    %
    dp=2*pc.*pb;%2*bsxfun(@times,pc,pb);
end
end
