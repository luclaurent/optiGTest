%% Schmidt-Vetters's function
% L. LAURENT -- 19/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(0.78547,0.78547,0.78547)=2.99845
%
%Design space 0<xi<10 (other minima outside of this space)


function [p,dp] = funSchmidtVetters(xx)

%constants
a=1;
b=pi;
c=2;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
z=xx(:,:,3);
%
pa=a+(x-y).^2;
ga=a./pa;
pb=(b*y+z)./c;
gb=sin(pb);
pc=((x+y)./y-c);
gc=exp(pc.^2);
%
p=ga+gb+gc;

if nargout==2
    %
    ax=-2*a*(x-y)./pa.^2;
    ay=-ax;
    by=b/c*cos(pb);
    bz=1/c*cos(pb);
    cx=2./y.*pc.*gc;
    cy=-2*x./y.^2.*pc.*gc;
    %
    dp=zeros(size(xx));
    dp(:,:,1)=ax+cx;
    dp(:,:,2)=ay+by+cy;
    dp(:,:,3)=bz;
end
end
