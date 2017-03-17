%% Gear function
%L. LAURENT -- 16/03/2017 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=2.7e-12 for x=[16 19 43 49]
%
%Design space: 12<xi<60
%



function [p,dp]=funGear(xx)
%constants
a=1;
b=6.931;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
z=xx(:,:,3);
w=xx(:,:,4);
%
fx=floor(x);
fy=floor(y);
fz=floor(z);
fw=floor(w);
%
p=(a/b-(fx.*fy)./(fz.*fz)).^2;

%
if nargout==2
    %
    dp=zeros(size(xx));
    %
    isInteger =@(input) (imag(input) == 0) & (round(input) == input);
    %
    dp(isInteger(xx))=1/eps;
end
end
