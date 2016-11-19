%% Price 2 function
%L. LAURENT -- 17/11/2016 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=0.9 for x=(0,0)
%
%Design space: -10<xi<10


function [p,dp]=funPrice02(xx)

%constants
a=1;
b=0.1;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
sx=sin(xxx);
sy=sin(yyy);
ex=exp(-xxx.^2-yyy.^2);
%
p=a+sx.^2+sy.^2-b*ex;

if nargout==2
    dp(:,:,1)=2*sx.*cos(xxx)+2*b*xxx.*ex;
    dp(:,:,2)=2*sy.*cos(yyy)+2*b*yyy.*ex;
end
end
