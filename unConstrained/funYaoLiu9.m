%% Yao-Liu 9 function
% L. LAURENT -- 28/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(0,...,0)=0
%
%Design space -5.12<xi<5.12

function [p,dp] = funYaoLiu9(xx)

%constants
a=10;
b=2*pi;

%evaluation and derivatives
pa=xx.^2-a*cos(b*xx)+a;
%
p=sum(pa,3);

if nargout==2   
    dp=2*xx+a*b*sin(b*xx);
end
end

