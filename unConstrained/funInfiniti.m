%% Infiniti function
%L. LAURENT -- 16/03/2017 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=0 for xi=0
%
%Design space: -1<xi<1
%



function [p,dp]=funInfiniti(xx)
%constants
a=2;

%evaluation and derivatives
pa=xx.^6;
pb=sin(1./xx)+a;
%
p=sum(pa.*pb,3);

%
if nargout==2
    %
    dp=6*xx.^5.*pb-xx.^4.*cos(1./xx);
end
end
