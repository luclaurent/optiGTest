%% Sodp function
% L. LAURENT -- 20/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(0,...,0)=0
%
%Design space -1<xi<1


function [p,dp] = funSodp(xx)

%evaluation and derivatives
sX=size(xx);
%
lI=1:sX(3);
lI=reshape(lI,1,1,[]);
%
pX=abs(xx).^(lI+1);
%
p=sum(pX,3);

if nargout==2
    %
    dp=(lI+1).*sign(xx).*abs(xx).^lI;
end
end
