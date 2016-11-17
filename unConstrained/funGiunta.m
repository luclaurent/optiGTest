%% Giunta function
%L. LAURENT -- 16/11/2016 -- luc.laurent@lecnam.net
%
%global minimum : f(x1,x2)=0.06447042053690566 for (0.4673200277395354, 0.4673200169591304)
%
%Design space: -1<xi<1

function [p,dp]=funGiunta(xx)

%constants
a=0.6;
b=16/15;
c=1;
d=1/50;
e=4;

%evaluation and derivatives
pa=sin(b*xx-c);
pb=sin(e*(b*xx-c));
pc=pa+pa.^2+d*pb;
p=a+sum(pc,3);
%
if nargout==2
    dp=b*cos(b*xx-c)+2*b*pa.*cos(b*xx-c)+d*e*b*cos(e*(b*xx-c));
end
end