%% Wayburn-Seader 1 function
% L. LAURENT -- 27/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(1,2)=0
%
%Design space -pi<xi<pi

function [p,dp] = funWayburnSeader1(xx)

%constants
a=17;
b=2;
c=4;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
%
pa=x.^6+y.^4-a;
pb=b*x+y-c;
%
p=pa.^2+pb.^2;

if nargout==2
    dp=zeros(size(xx));
    dp(:,:,1)=12*x.^5.*pa+2*b*pb;
    dp(:,:,2)=8*y.^3.*pa+2*pb;
    
end
end

