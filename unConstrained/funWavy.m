%% Wavy function
% L. LAURENT -- 27/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(0,...,0)=0
%
%Design space -pi<xi<pi

function [p,dp] = funWavy(xx)

%constants
a=1;
b=1/2;
k=10;
nbvar=size(xx,3);

%evaluation and derivatives
cx=cos(k*xx);
ex=exp(-b*xx.^2);
pcx=cx.*ex;
%
p=a-1/nbvar.*sum(pcx,3);

if nargout==2
    %
    sx=sin(k*xx);
    %
    dp=1/nbvar*ex.*(k*sx+xx.*cx);
    
end
end

