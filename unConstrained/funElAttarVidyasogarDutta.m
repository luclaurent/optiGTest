%% El-Attar-Vidyasogar-Dutta's function
%L. LAURENT -- 15/11/2016 -- luc.laurent@lecnam.net
%
%global minimum : f(x1,x2)=1.712780354 for (3.40918683, -2.17143304)
%
%Design space: -500<xi<500


function [p,dp]=funElAttarVidyasogarDutta(xx)

%constants
a=10;
b=7;
c=1;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
pa=xxx.^2+yyy-a;
pb=xxx+yyy.^2-b;
pc=xxx.^2+yyy.^3-c;
p=pa.^2+pb.^2+pc.^2;
%
if nargout==2
    dp(:,:,1)=4*xxx.*pa+2*pb+4*xxx.*pc;
    dp(:,:,2)=2*pa+4*yyy.*pb+6*yyy.^2.*pc;
end
end