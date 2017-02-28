%% Wayburn-Seader 2 function
% L. LAURENT -- 27/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(0.2,1)=0
%
%Design space -500<xi<500

function [p,dp] = funWayburnSeader2(xx)

%constants
a=1.613;
b=4;
c=0.3125;
d=1.625;
e=1;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
%
pa=a-b*(x-c).^2-b*(y-d).^2;
pb=y-e;
%
p=pa.^2+pb.^2;

if nargout==2
    dp=zeros(size(xx));
    dp(:,:,1)=-4*b*(x-c).*pa;
    dp(:,:,2)=-4*b*(y-d).*pa+2*pb;    
end
end

