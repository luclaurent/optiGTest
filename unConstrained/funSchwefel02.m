%% Schwefel 2 function
% L. LAURENT -- 19/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(0,...,0)=0
%
%Design space -100<xi<100


function [p,dp] = funSchwefel02(xx)

%evaluation and derivatives
sX=[size(xx,1) size(xx,2) size(xx,3)];
p=zeros(sX(1),sX(2));
for itX=1:sX(3)
    p=p+sum(xx(:,:,1:itX),3).^2;
end

if nargout==2
    %
    dp=zeros(sX);
    for itX=1:sX(3)
        for itD=itX:sX(3)
            dp(:,:,itX)=dp(:,:,itX)+2*sum(xx(:,:,1:itD),3);
        end
    end
end
end
