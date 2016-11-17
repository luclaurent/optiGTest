%% Mishra 4 function
%L. LAURENT -- 17/11/2016 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=-0.199409 for x=(-9.84112,-10)
%
%Design space: -10<xi<10


function [p,dp]=funMishra04(xx)

%constants
a=1e-2;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
p=sqrt(abs(sin(sqrt(xxx.^2+yyy.^2))))+a*(xxx+yyy);

if nargout==2
    dp(:,:,1)=0.5*xxx./sqrt(xxx.^2+yyy.^2)...
        .*cos(sqrt(xxx.^2+yyy.^2))...
        .*sign(sin(sqrt(xxx.^2+yyy.^2)))...
        ./sqrt(abs(sin(sqrt(xxx.^2+yyy.^2))))...
        +a;
    dp(:,:,2)=0.5*yyy./sqrt(xxx.^2+yyy.^2)...
        .*cos(sqrt(xxx.^2+yyy.^2))...
        .*sign(sin(sqrt(xxx.^2+yyy.^2)))...
        ./sqrt(abs(sin(sqrt(xxx.^2+yyy.^2))))...
        +a;
end
end
