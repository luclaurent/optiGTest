%% Mishra 8 function
%L. LAURENT -- 17/11/2016 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=0 for x=(2,-3)
%
%Design space: -10<xi<10


function [p,dp]=funMishra08(xx)

%constants
aa=0.001;
a=[1,-20,180,-960,3360,-8064,1334,-15360,11520,-5120,2624];
b=[1,12,54,108,81];

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
itg=reshape(10:-1:0,1,1,11);
gt=bsxfun(@power,xxx,itg);
g=bsxfun(@times,gt,reshape(a(11-itg),1,1,11));
ith=reshape(4:-1:0,1,1,5);
ht=bsxfun(@power,yyy,ith);
h=bsxfun(@times,ht,reshape(b(5-ith),1,1,5));
%
pa=sum(h,3).*sum(g,3);
p=aa*pa.^2;

if nargout==2
    itdg=reshape(10:-1:1,1,1,10);
    dgt=bsxfun(@power,xxx,itdg-1);    
    dgtt=bsxfun(@times,dgt,itdg);
    dg=bsxfun(@times,dgtt,reshape(a(11-itdg),1,1,10));
    itdh=reshape(4:-1:1,1,1,4);
    dht=bsxfun(@power,xxx,itdh-1);
    dhtt=bsxfun(@times,dht,itdh);
    dh=bsxfun(@times,dhtt,reshape(b(5-itdh),1,1,4));
    %
    dp(:,:,1)=2*aa*sum(h,3).*sum(dg,3).*pa;
    dp(:,:,2)=2*aa*sum(g,3).*sum(dh,3).*pa;
end
end
