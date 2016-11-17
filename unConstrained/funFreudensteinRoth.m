%% Freudenstein Roth function
%L. LAURENT -- 16/11/2016 -- luc.laurent@lecnam.net
%
%global minimum : f(x1,x2)=0 for (5,4)
%
%Design space: -10<xi<10

function [p,dp]=funFreudensteinRoth(xx)

%constants
a=13;
b=5;
c=2;
d=29;
e=1;
f=14;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
pa=xxx-a+yyy.*((b-yyy).*yyy-c);
pb=xxx-d+((yyy+e).*yyy-f).*yyy;
p=pa.^2+pb.^2;
%
if nargout==2
    dp(:,:,1)=2*(pa+pb);
    dp(:,:,2)=2*((b-yyy).*yyy...
        -c+yyy.*(b-2*yyy)).*pa...
        +2*(yyy.*(yyy+e)-f+yyy.*(2*yyy+e)).*pb;
end
end