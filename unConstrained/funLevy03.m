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


%evaluation and derivatives
y=b+(xx-b)./c;
%
pa=sin(a*y(:,:,1));
pb=y(:,:,1:end-1)-b;
pc=b+c*sin(a*y(:,:,2:end));
pd=y(:,:,end)-b;
%
p=pa.^2+sum(pb.^2.*pc,3)+pd.^2;

%
if nargout==2
    %
    dp=zeros(size(xx));
    %
    dp(:,:,1)=2/c*pa.*cos(a*y(:,:,1))...
        +2/c.*pb(:,:,1).*pc(:,:,1);
    dp(:,:,end)=pb(:,:,end).^2.*a/c.**cos(a*y(:,:,end))+2/c.*pd;
    dp(:,:,2:end-1)=2/c*pb(:,:,2:end).*pc(:,:,1:end)...
        +a/c*cos(a*y(:,:,end-1)).*pb(:,:,1:end-1);
end
