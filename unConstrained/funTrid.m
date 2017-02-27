%% Trid function
% L. LAURENT -- 23/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(6,10,12,12,10,6)=-50
%
%Design space -20<xi<20


function [p,dp] = funTrid(xx)

%evaluation and derivatives
pa=sum((xx-1).^2,3);
pb=sum(xx(:,:,2:end).*xx(:,:,1:end-1),3);
%
p=pa-pb;


if nargout==2
    %
    dp=zeros(size(xx)); 
    %
    dp(:,:,1)=2*(xx(:,:,1)-1)-xx(:,:,2);
    dp(:,:,end)=2*(xx(:,:,end)-1)-xx(:,:,end-1);
    dp(:,:,2:end-1)=2*(xx(:,:,2:end-1)-1)-xx(:,:,3:end)-xx(:,:,1:end-2);
end
end
