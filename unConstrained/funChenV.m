%% Chen V's function
%L. LAURENT -- 04/11/2016 -- luc.laurent@lecnam.net
%
%1 global minimum
%f(x1,x2)=-2000 for (x1,x2)=(7/18,13/18)
%
%Design space: -500<x1,x2<500




function [p,dp]=funChenV(xx)

%constants
a=1e-3;
b=0.4;
c=0.1;
d=2;
e=1.5;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluations and derivatives
pa=xxx-b*yyy-c;
da=a^2+pa.^2;
pb=d*xxx+yyy-e;
db=a^2+pb.^2;
p=-a./da-a./db; 

if nargout==2
    dp(:,:,1)=2*a*pa./da.^2 ...
        +2*a*d*pb./db.^2;
    dp(:,:,2)=-2*a*b*pa./da.^2 ...
        +2*a*pb./db.^2;
end
end