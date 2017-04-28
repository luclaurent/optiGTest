%% Step Int function
% L. LAURENT -- 28/04/2017 -- luc.laurent@lecnam.net
%
%global minimum : f(xi)=25 pour (x1,x2,x3,x4)=(0,...,0)
%Design space: -5<xi<5


function [p,dp] = funStepInt(xx)

%constant 
a=25;

%evaluation and derivatives
pa=floor(xx);
%
p=25+sum(pa,3);

if nargout==2
    %function for testinf integer
    fun=@(input) (imag(input) == 0) & (round(input) == input);
    isInt=fun(xx);
    %    
    dp=zeros(size(xx));
    dp(isInt)=1/eps;
end
end
