%% Cigar function 
%L. LAURENT -- 14/03/2017 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=-24.15681551650653 for xi=+/- 9.646157266348881
%
%Design space: -10<xi<10


function [p,dp]=funCigar(xx)
%constants
a=1e6;

%evaluation and derivatives
x=xx(:,:,1);
%
pa=sum(xx.^2,3);
%
p=x.^2+a*pa;

if nargout==2
    %
    dp=zeros(size(xx));
    %
    dp(:,:,1)=2*x+2*a*x;
    dp(:,:,2:end)=2*a*xx(:,:,2:end);
end
end
