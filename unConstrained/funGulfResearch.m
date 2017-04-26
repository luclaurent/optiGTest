%% Gulf Research function
%L. LAURENT -- 16/11/2016 -- luc.laurent@lecnam.net
%
%global minimum : f(x1,x2)=0 for (50,25,1.5)
%
%Design space: 0<xi<60

%similar to Weibull function

function [p,dp]=funGulfResearch(xx)

%constants
a=99;
b=25;
c=-50;
d=1/1.5;
f=0.01;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
z=xx(:,:,3);
%
listI=reshape(1:a,1,1,a);
%
zi=f*listI;
yi=b+(c*log(1./zi)).^d;
%
pa=yi-z;
pb=pa.^y./x;
pc=exp(-pb);
pd=pc-zi;
%
p=sum(pd.^2,3);

%
if nargout==2
    %
    dp=zeros(size(xx));
    %
    dp(:,:,1)=2*sum(pb./x.*pc.*pd,3);
    dp(:,:,2)=2*sum(-log(pa)./x.*pb.*pc.*pd,3);
    dp(:,:,3)=2*sum(pa.^(y-1)./x.*y.*pc.*pd,3);
end
end