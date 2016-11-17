%% Mishra 10 function
%L. LAURENT -- 17/11/2016 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=0 for x=(2,2)
%
%Design space: -10<xi<10


function [p,dp]=funMishra10(xx)

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
fx=floor(xxx);
fy=floor(yyy);
p=(fx.*fy-fx-fy).^2;

if nargout==2
    dp=NaN(size(xx));
end
end
