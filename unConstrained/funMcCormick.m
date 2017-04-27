%% McCormick's function
%L. LAURENT -- 17/11/2016 -- luc.laurent@lecnam.net
%
%global minimum : f(x1,x2)=-1.9133 for (x1,x2)=(?0.547,?1.547)
%
%Design space: -1.5<x1<4 & -3<x2<3


function [p,dp]=funMcCormick(xx)
%constants
a=3/2;
b=5/2;
c=1;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
pa=xxx-yyy;
pb=xxx+yyy;
p=sin(pb)+pa.^2-a*xxx+b*yyy+c;

if nargout==2
    dp(:,:,1)=cos(pb)+2*pa-a;
    dp(:,:,2)=cos(pb)-2*pa+b;
end
end
