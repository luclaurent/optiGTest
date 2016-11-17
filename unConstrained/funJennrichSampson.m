%% Jennrich-Sampson's function
%L. LAURENT -- 17/11/2016 -- luc.laurent@lecnam.net
%
%global minimum : f(x1,x2)=124.3612 for (x1,x2)=(0.257825,0.257825)
%
%Design space: -1<xi<1


function [p,dp]=funJennrichSampson(xx)
%constants
a=2;
b=10;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
ii=reshape(1:b,1,1,b);
ex=bsxfun(@power,exp(xxx),ii);
ey=bsxfun(@power,exp(yyy),ii);
se=bsxfun(@minus,a*ii,ex+ey);
%
p=sum((a+se).^2,3);

if nargout==2
    iex=bsxfun(@times,ii,ex);
    iey=bsxfun(@times,ii,ey);
    %
    dp(:,:,1)=sum(-iex*2.*(a+se),3);
    dp(:,:,2)=sum(-iey*2.*(a+se),3);
end
end
