%% Pinter function
%L. LAURENT -- 21/03/2017 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=0 for xi=0
%
%Design space: -10<xi<10
%



function [p,dp]=funPinter(xx)
%constants
a=20;
b=2;
c=3;
d=1;

%evaluation and derivatives
nbvar=size(xx,3);
%
xxm=xx(:,:,[end 1:end 1]);
%
A=xxm(:,:,1:end-2).*sin(xx)+sin(xxm(:,:,3:end));
B=xxm(:,:,1:end-2)-b*xx+c*xxm(:,:,3:end)-cos(xx)+d;
%
listI=reshape(1:nbvar,1,1,nbvar);
%
pa=listI.*xx.^2;
pb=a*listI.*sin(A).^2;
pc=listI.*log10(1+listI.*B.^2);
%
p=sum(pa+pb,3);%sum(pa+pb+pc,3);
%
if nargout==2
    %
    dp=2*listI.*xx;
    %
    Akm=cos(xx);
    Ak=xxm(:,:,1:end-2).*cos(xx);
    Akp=sin(xxm(:,:,3:end));
    %
    Bkm=c;
    Bk=sin(xx)-b;
    Bkp=2*xx;
    %
    dp(:,:,1)=dp(:,:,1)...
        +2*a*Ak(:,:,1).*cos(A(:,:,1)).*sin(A(:,:,1))...
        +4*a*Akp(:,:,1).*cos(A(:,:,2)).*sin(A(:,:,2))...
        +2*nbvar*a*Akm(:,:,end).*sin(A(:,:,end)).*cos(A(:,:,end));
        %+2*a*sin(A1).*cos(A1).*xx(:,:,end).*cos(xx(:,:,1))...
        %+4*a*sin(A2).*cos(A2).*sin(xx(:,:,2))...
        %+2*nbvar*a*cos(xx(:,:,end)).*sin(Ae).*cos(Ae);%...
        %+2*B1.*(-b+sin(xx(:,:,1)))./(log(10)*(1+B1.^2))...
        %+16*B2.*xx(:,:,1)./(log(10)*(1+2*B2.^2))...
        %+2*nbvar^2*c*Be./(log(10)*(1+nbvar*Be.^2));
        
    dp(:,:,end)=dp(:,:,end);...
%         +2*a*nbvar*xx(:,:,end-1).*sin(Ae).*cos(Ae)...
%         +2*a*(nbvar-1)*cos(xx(:,:,end)).*sin(Aem).*cos(Aem)...
%         +2*a*sin(xx(:,:,end)).*sin(A1).*cos(A1)...
%         +4*xx(:,:,end).*B1./(log(10)*(1+B1.^2))...
%         +2*nbvar^2*Be.*(sin(xx(:,:,end))-b)./(log(10)*(1+nbvar*Be.^2))...
%         +2*c*(nbvar-1)^2.*Bem./(log(10)*(1+(nbvar-1).*Bem.^2));
    %dp(:,:,2:end-1)=2*a*b*sc(:,:,1:end-1).*cc(:,:,1:end-1).*pb(:,:,1:end-1).^2 ...
    %    +2*a*pb(:,:,2:end).*pc(:,:,2:end)...
    %    +du(:,:,2:end-1);
end