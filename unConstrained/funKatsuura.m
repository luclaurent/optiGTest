%% Katsuura function
%L. LAURENT -- 17/03/2017 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=1 for xi=0
%
%Design space: 0<xi<100
%



function [p,dp]=funKatsuura(xx)
%constants
d=32;

%evaluation and derivatives
sX=size(xx,3);
%
lD=reshape(1:d,1,1,1,d);
lI=reshape(1:sX,1,1,sX);
%
pa=2.^lD.*xx;
pbf=floor(pa).*2.^lD;
%
spb=sum(pbf,4);
pt=1+lI.*spb;
%
p=prod(pt,3);

%
if nargout==2
    %
    dp=zeros(size(xx));
    %
    isInteger =@(input) (imag(input) == 0) & (round(input) == input);
    %
    dp(isInteger(xx))=1/eps;
end
end
