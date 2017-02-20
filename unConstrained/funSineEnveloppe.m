%% Sine Enveloppe function
% L. LAURENT -- 20/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(0,...,0)=0
%
%Design space -100<xi<100


function [p,dp] = funSineEnveloppe(xx)

%evaluation and derivatives
sX=size(xx);
%
lI=1:sX(3);
lI=reshape(lI,1,1,[]);
%
pa=xx-1./lI;
rEps=rand(sX);
pb=rEps.*abs(pa);
%
p=sum(pb,3);

if nargout==2
    %
    dp=rEps.*sign(pa);
end
end
