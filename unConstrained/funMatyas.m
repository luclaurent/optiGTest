%% Matyas's function
%L. LAURENT -- 17/11/2016 -- luc.laurent@lecnam.net
%
%global minimum : f(x1,x2)=0 for (x1,x2)=(0,0)
%
%Design space: -10<xi<10


function [p,dp]=funMatyas(xx)
%constants
a=0.26;
b=0.48;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
p=a*(xxx.^2+yyy.^2)-b*xxx.*yyy;

if nargout==2
    dp(:,:,1)=2*a*xxx-b*yyy;
    dp(:,:,2)=2*a*yyy-b*xxx;
end
end
