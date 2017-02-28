%% ZeroSum function
% L. LAURENT -- 28/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(x)=0 such as Sum xi=0
%
%Design space -10<xi<10

function [p,dp] = funZeroSum(xx)

%constants
a=1;
b=10^4;
c=1/2;

%evaluation and derivatives
sumX=sum(xx,3);
%
p=a+(b*abs(sumX)).^c;
%
IX=sumX==0;
p(IX)=0;

if nargout==2   
    dp=c*b^c.*sign(sumX).*abs(sumX).^(c-1);
end
end

