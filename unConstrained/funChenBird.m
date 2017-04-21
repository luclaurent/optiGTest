%% Chen Bird's function
%L. LAURENT -- 04/11/2016 -- luc.laurent@lecnam.net
%
%2 global minima
%f(x1,x2)=-2000 for (x1,x2)={(0.5,0.5),(-0.5,-0.5)}
%
%Design space: -500<x1,x2<500




function [p,dp]=funChenBird(xx)

%constants
a=1e-3;
b=1;
c=0.5;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluations and derivatives
pa=xxx.^2+yyy.^2-b;
da=a^2+pa.^2;
pb=xxx.^2+yyy.^2-c;
db=a^2+pb.^2;
pc=xxx-yyy;
dc=a^2+pc.^2;
p=-a./da-a./db-a./dc; 

if nargout==2
    dp(:,:,1)=4*a*xxx.*pa./da.^2 ...
        +4*a*xxx.*pb./db.^2 ...
        +4*a.*pc./dc.^2;
    dp(:,:,2)=4*a*yyy.*pa./da.^2 ...
        +4*a*yyy.*pb./db.^2 ...
        -4*a.*pc./dc.^2;
end
end