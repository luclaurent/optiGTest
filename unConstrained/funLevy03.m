%% Levy 03 function
%L. LAURENT -- 17/03/2017 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=0 for xi=1
%
%Design space: -10<xi<10
%


function [p,dp]=funLevy03(xx)
%constants
a=pi;
b=1;
c=4;
d=10;

%evaluation and derivatives
y=b+(xx-b)./c;
%
pa=sin(a*y(:,:,1));
pb=y(:,:,1:end-1)-b;
sc=sin(a*y(:,:,1:end-1)+b);
pc=b+d*sc.^2;
pd=y(:,:,end)-b;
se=sin(2*a*y(:,:,end));
pe=b+se.^2;
%
p=pa.^2+sum(pb.^2.*pc,3)+pd.^2.*pe;

%
if nargout==2
    %
    dp=zeros(size(xx));
    %
    cc=cos(a*y(:,:,1:end-1)+b);
    ce=cos(2*a*y(:,:,end));
    %
    dp(:,:,1)=2*a/c*pa.*cos(a*y(:,:,1))...
        +2/c.*pb(:,:,1).*pc(:,:,1)...
        +2*d*a/c*sc(:,:,1).*cc(:,:,1).*pb(:,:,1).^2;
    dp(:,:,end)=2/c*pd.*pe...
        +4*a/c*se.*ce.*pd.^2;
    dp(:,:,2:end-1)=2/c*pb(:,:,2:end).*pc(:,:,2:end)...
        +2*d*a/c*sc(:,:,2:end).*cc(:,:,2:end).*pb(:,:,2:end).^2;
end
