%% Sargan function
% L. LAURENT -- 14/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(0,...,0)=0
%
%Design space -100<xi<100


function [p,dp] = funSargan(xx)

%constants
a=0.4;

%evaluation and derivatives
nbX=size(xx);
pxy=zeros(nbX(1),nbX(2));
ppxy=zeros(nbX(1),nbX(2));
for itN=1:nbX(3)
    for itM=1:itN-1
        pxy=pxy+2*xx(:,:,itM).*xx(:,:,itN);
    end
end

p=nbX(3)*(sum(xx.^2,3)+a*pxy);

if nargout==2
    %
    sxy=sum(xx,3);
    dxy=sxy(:,:,ones(1,nbX(3)))-xx;
    dp=nbX(3)*(2*xx+2*a*dxy);
end
end
