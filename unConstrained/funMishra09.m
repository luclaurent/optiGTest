%% Mishra 9 function
%L. LAURENT -- 17/11/2016 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=0 for x=(1,2,3)
%
%Design space: -10<xi<10


function [p,dp]=funMishra09(xx)

%constants
d=[2,5,4,-2,-18];
e=-22;
f=[8,2,2,3,-52];

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);
zzz=xx(:,:,3);

%evaluation and derivatives
a=d(1)*xxx.^3+d(2)*xxx.*yyy+d(3)*zzz+d(4)*xxx.^2.*zzz+d(5);
b=xxx+yyy.^3+xxx.*zzz.^2+e;
c=f(1)*xxx.^2+f(2)*yyy.*zzz+f(3)*yyy.^2+f(4)*yyy.^3+f(5);
k=xxx+yyy-zzz;
%
pa=a.*b.^2.*c+a.*b.*c.^2+b.^2+k.^2;
p=pa.^2;

if nargout==2
    daX=3*d(1)*xxx.^2+d(2)*yyy+2*d(4)*xxx.*zzz;
    daY=d(2)*xxx;
    daZ=d(3)+d(4)*xxx.^2;
    dbX=1+zzz.^2;
    dbY=3*yyy.^2;
    dbZ=2*xxx.*zzz;
    dcX=2*f(1)*xxx;
    dcY=f(2)*zzz+2*f(3)*yyy+3*f(4)*yyy.^2;
    dcZ=f(2)*yyy;
    dkX=1;
    dkY=1;
    dkZ=-1;
    %
    dp(:,:,1)=2*pa.*(daX.*b.^2.*c+2*a.*dbX.*b.*c+a.*b.^2.*dcX...
        +daX.*b.*c.^2+a.*dbX.*c.^2+2*a.*b.*dcX.*c...
        +2*dbX+2*dkX.*k);
    dp(:,:,2)=2*pa.*(daY.*b.^2.*c+2*a.*dbY.*b.*c+a.*b.^2.*dcY...
        +daY.*b.*c.^2+a.*dbY.*c.^2+2*a.*b.*dcY.*c...
        +2*dbY+2*dkY.*k);
    dp(:,:,3)=2*pa.*(daZ.*b.^2.*c+2*a.*dbZ.*b.*c+a.*b.^2.*dcZ...
        +daZ.*b.*c.^2+a.*dbZ.*c.^2+2*a.*b.*dcZ.*c...
        +2*dbZ+2*dkZ.*k);
end
end