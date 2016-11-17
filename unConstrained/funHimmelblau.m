%% Himmelblau function
%L. LAURENT -- 17/11/2016 -- luc.laurent@lecnam.net
%
%global minimum : f(x1,x2)=0 for (x1,x2)=(3,2)
%
%Design space: -5<xi<5


function [p,dp]=funHimmelblau(xx)
%constants
a=11;
b=7;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
pa=xxx.^2+yyy-a;
pb=xxx+yyy.^2-b;
%
p=pa.^2+pb.^2;

if nargout==2
    dp(:,:,1)=4*xxx.*pa+2*pb;
    dp(:,:,2)=2*pa+4*yyy.*pb;
end
end
