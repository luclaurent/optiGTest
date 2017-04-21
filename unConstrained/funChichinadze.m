%% Chichinadze's function
%L. LAURENT -- 04/11/2016 -- luc.laurent@lecnam.net
%
%1 global minimum
%f(x1,x2)=-42.94438701899098  for (x1,x2)=(6.189866586965680,0.5)
%
%Design space: -500<x1,x2<500




function [p,dp]=funChichinadze(xx)

%constants
a=12;
b=11;
c=10;
d=pi/2;
e=8;
f=5*d;
g=0.2*sqrt(5);
h=1/2;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluations and derivatives
pa=xxx.^2-a*xxx+b;
pb=c*cos(d*xxx)+e*sin(f*xxx);
pc=exp(-h*(yyy-h).^2);
%
p=pa+pb+g*pc;

if nargout==2
    dp(:,:,1)=2*xxx-a...
        -c*d*sin(d*xxx)+e*f*cos(f*xxx);
    dp(:,:,2)=-2*h*g*yyy.*pc;
end
end