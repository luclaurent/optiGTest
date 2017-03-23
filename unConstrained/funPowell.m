%% Powell function
%L. LAURENT -- 23/03/2017 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=0 for xi=0
%
%Design space: -4<xi<5
%

function [p,dp]=funPowell(xx)
%constants
a=10;
b=5;
c=2;
d=10;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
z=xx(:,:,3);
v=xx(:,:,4);
%
pa=z+a*x;
pb=y-v;
pc=x-c*y;
pd=z-v;
%
p=sum(pa.^2+b*pb.^2+pc.^4+d*pd.^4,3);
%
if nargout==2
    %
    dp=zeros(size(xx));
    %
    dp(:,:,1)=2*a*pa+4*pc.^3;
    dp(:,:,2)=2*b*pb-4*c*pc.^3;
    dp(:,:,3)=2*pa+4*d*pd.^3;
    dp(:,:,4)=-2*b*pb-4*d*pd.^3;
end