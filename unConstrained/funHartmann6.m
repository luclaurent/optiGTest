%% Hartmann 6 function
%L. LAURENT -- 16/11/2016 -- luc.laurent@lecnam.net
%
%global minimum : f(x1,x2)=-3.32236801141551 for (x1,x2)=(0.20168952, 0.15001069, 0.47687398, 0.27533243, 0.31165162, 0.65730054)
%
%Design space: 0<xi<1


function [p,dp]=funHartmann6(xx)
%constants
ma=[10.00,  0.05,  3.00, 17.00;
    3.00, 10.00,  3.50,  8.00;
    17.00, 17.00,  1.70,  0.05;
    3.50,  0.10, 10.00, 10.00;
    1.70,  8.00, 17.00,  0.10;
    8.00, 14.00,  8.00, 14.00];
mp=[0.1312, 0.2329, 0.2348, 0.4047;
    0.1696, 0.4135, 0.1451, 0.8828;
    0.5569, 0.8307, 0.3522, 0.8732;
    0.0124, 0.3736, 0.2883, 0.5743;
    0.8283, 0.1004, 0.3047, 0.1091;
    0.5886, 0.9991, 0.6650, 0.0381];
c=[1.0, 1.2, 3.0, 3.2];
b=4;
dim=6;


%evaluation and derivatives
sX=size(xx);
p=zeros(sX(1),sX(2));
for it=1:b
    pa=bsxfun(@minus,xx,reshape(mp(:,it),1,1,dim));    
    pb=bsxfun(@times,reshape(ma(:,it),1,1,dim),pa.^2);
    p=p-c(it)*exp(-sum(pb,3));
end

if nargout==2
    dp=zeros(sX);
    %
    for it=1:b
        pa=bsxfun(@minus,xx,reshape(mp(:,it),1,1,dim));
        pb=bsxfun(@times,reshape(ma(:,it),1,1,dim),pa.^2);
        pc=exp(-sum(pb,3));
        pe=bsxfun(@times,reshape(ma(:,it),1,1,dim),pa);
        %
        for itD=1:dim
            dp(:,:,itD)=dp(:,:,itD)+2*c(it)*pe(:,:,itD).*pc;
        end
    end
end
end
