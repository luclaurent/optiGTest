%% Zacharov function
% L. LAURENT -- 28/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(0,...,0)=0
%
%Design space -5.12<xi<5.12

function [p,dp] = funZacharov(xx)

%constants
a=1/2;

%evaluation and derivatives
sX=size(xx,3);
%
li=reshape(1:sX,1,1,[]);
pa=xx.^2;
pb=li.*xx;
pbb=sum(pb,3);
%
p=sum(pa,3)+a^2*pbb.^2+a^4*pbb.^4;

if nargout==2   
    dp=2*xx+2*a^2*li.*pbb+4*a^4*li.*pbb.^3;
end
end

