%% Six-Hump camel back function
%L. LAURENT -- 13/12/2010 -- luc.laurent@lecnam.net
%
%6 local minima and  2 global:
%f(x1,x2)=-1.0316 for (x1,x2)={(-0.0898,0.7126),(0.0898,0.7126)}
%
%Design space: -3<x1<3 -2<x2<2
%(recommanded: -2<x1<2 -1<x2<1)

function [p,dp]=funCamelbackSixHump(xx)

%constants
a=4;
b=2.1;
c=3;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluations and derivatives
pa=(a-b*xxx.^2+xxx.^4/c);
pb=(-1+yyy.^2);
p=pa.*xxx.^2+...
    xxx.*yyy...
    +a*pb.*yyy.^2;   
    
if nargout==2
    dp(:,:,1)=2*xxx.*pa...
        +xxx.^2.*(-2*b*xxx+a*xxx.^3/c)...
        +yyy;
    dp(:,:,2)=xxx...
        +2*a*yyy.*pb...
        +2*a*yyy.^3;
end
end