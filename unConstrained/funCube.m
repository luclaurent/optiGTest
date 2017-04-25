%% Cube's function
%L. LAURENT -- 05/11/2016 -- luc.laurent@lecnam.net
%
%4 global minimas : f(x1,x2,x3,x4)=0 for (-1,1)
%
%Design space: -10<xi<10



function [p,dp]=funCube(xx)

%constants
a=100;
b=1;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
pa=yyy-xxx.^3;
pb=b-xxx;
p=a*pa.^2+pb.^2;
%
if nargout==2
    dp(:,:,1)=-6*a*xxx.^2.*pa-2*pb;
    dp(:,:,2)=2*a*pa;
end
end