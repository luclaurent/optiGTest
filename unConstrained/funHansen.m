%% Hansen function
%L. LAURENT -- 16/11/2016 -- luc.laurent@lecnam.net
%
%global minimum : f(x1,x2)=-176.5418 for 
%   (x1,x2)={(-7.589893, -7.708314), (-7.589893, -1.425128),
%   (-7.589893, 4.858057), (-1.306708, -7.708314),
%   (-1.306708, 4.858057), ( 4.976478, 4.858057),
%   ( 4.976478, -1.425128), ( 4.976478, -7.708314)}
%
%Design space: -10<xi<10


function [p,dp]=funHansen(xx)
%constants
a=4;
b=1;
c=2;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
ii=reshape(0:a,1,1,a+1);
pa=bsxfun(@times,ii,xxx);
pb=bsxfun(@plus,ii,pa);
pc=bsxfun(@times,(ii+c),yyy);
pd=bsxfun(@plus,ii,pc);
pe=bsxfun(@times,(ii+b),cos(pb+b));
pf=bsxfun(@times,(ii+b),cos(pd+b));
%
pta=sum(pe,3);
ptb=sum(pf,3);
p=pta.*ptb;

if nargout==2
    pg=bsxfun(@times,ii.*(ii+b),sin(pb+b));
    ph=bsxfun(@times,(ii+c).*(ii+b),sin(pd+b));
    %
    dp(:,:,1)=-sum(pg,3).*ptb;
    dp(:,:,2)=-sum(ph,3).*pta;   
end
end
