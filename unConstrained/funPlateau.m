%% Plateau function
%L. LAURENT -- 23/03/2017 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=30 for xi=0
%
%Design space: -5.12<xi<5.12
%

function [p,dp]=funPlateau(xx)
%constants
a=30;

%evaluation and derivatives
pa=floor(abs(xx));
%
p=sum(a+pa,3);
%
if nargout==2
    %
    dp=zeros(size(xx));
    %
    isInteger =@(input) (imag(input) == 0) & (round(input) == input);
    %
    siX=sign(xx);
    %
    isInt=isInteger(xx);
    %
    dp(isInt)=1/eps*siX(isInt);
end