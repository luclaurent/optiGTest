%% Step function
% L. LAURENT -- 16/09/2011 -- luc.laurent@lecnam.net
%
%global minimum : f(xi)=0 pour (x1,x2,x3,x4)=(0,...,0)
%Design space: -5<xi<5


function [p,dp] = funStep(xx)

%constant
a=1/2;

%evaluation and derivatives
pa=floor(xx)+a;
pb=pa.^2;
%
p=sum(pb,3);

if nargout==2
    %function for testinf integer
    fun=@(input) (imag(input) == 0) & (round(input) == input);
    isInt=fun(xx);
    %    
    dp=zeros(size(xx));
    dp(isInt)=1/eps;
end
end
