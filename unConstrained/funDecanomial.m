%% Decanomial function 
%L. LAURENT -- 14/03/2017 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=0 for x=[2,-3]
%
%Design space: -10<xi<10


function [p,dp]=funDecanomial(xx)
%constants
a01=1e-3;
a02=12;
a03=54;
a04=108;
a05=81;
a06=20;
a07=180;
a08=960;
a09=3360;
a10=8064;
a11=13340;
a12=15360;
a13=11520;
a14=51202;
a15=2624;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
%
pa=y.^4+a02*y.^3+a03*y.^2+a04*y+a05;
pb=x.^10-a06*x.^9+a07*x.^8-a08*x.^7+a09*x.^6-a10*x.^5+a11*x.^4-a12*x.^3+a13*x.^2-a14*x+a15;
pc=(abs(pa)+abs(pb));
%
p=a01*pc.^2;
%
if nargout==2
    %
    dp=zeros(size(xx));
    %
    dp(:,:,1)=2*a01*pc.*sign(pb).*...
        (10*x.^9-9*a06*x.^8+8*a07*x.^7-7*a08*x.^6+6*a09*x.^5-5*a10*x.^4+4*a11*x.^3-3*a12*x.^2+2*a13*x-a14);
    dp(:,:,2)=2*a01*pc.*sign(pa).*...
        (4*y.^3+3*a02*y.^2+2*a03*y+a04);
end
end
