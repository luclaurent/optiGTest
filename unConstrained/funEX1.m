%% EX1 function
%L. LAURENT -- 16/11/2016 -- luc.laurent@lecnam.net
%
%global minimum : f(x1,x2)=-1.28186 for (1.764,11.15)
%
%Design space: 0<xi<12

function [p,dp]=funEX1(xx)

%constants
a=0.1;
b=1;
c=10;
d=11;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
p=a*(b-xxx.^2)+a*sin(c*xxx)+(d-yyy).^2+sin(c*yyy);
%
if nargout==2
    dp(:,:,1)=-2*xxx*a+a*c*cos(c*xxx);
    dp(:,:,2)=-2*(d-yyy)+c*cos(c*yyy);
end
end