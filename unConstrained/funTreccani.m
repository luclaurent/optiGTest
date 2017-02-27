%% Treccani function
% L. LAURENT -- 23/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(-2,0)=0
%
%Design space -5<xi<5


function [p,dp] = funTreccani(xx)

%constants
a=4;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
%
p=x.^4+a*x.^3+a*x.^2+y.^2;

if nargout==2
    %
    dp=zeros(size(xx));
    %
    dp(:,:,1)=4*x.^3+3*a*x.^2+2*a*x;
    dp(:,:,2)=2*y;
end
end
