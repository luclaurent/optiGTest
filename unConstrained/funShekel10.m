%% Shekel 10 function
% L. LAURENT -- 19/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(4,4,4,4)=-10.5319
%
%Design space 0<xi<10


function [p,dp] = funShekel10(xx)

%constants
a=[
    4 4 4 4
    1 1 1 1
    8 8 8 8
    6 6 6 6
    3 7 3 7
    2 9 2 9
    5 5 3 3
    8 1 8 1
    6 2 6 2
    7 3.6 7 3.6
    ];
c=0.1*[1 2 2 4 4 6 3 7 5 5]';
m=10;

%evaluation and derivatives
sX=[size(xx,1) size(xx,2) size(xx,3)];
p=zeros(sX(1),sX(2));
for itI=1:m
    aI=a(itI,:);
    aR=reshape(aI,1,1,[]);
    pTmp=xx-aR(ones(1,sX(1)),ones(1:sX(2)),:);
    hI=c(itI)+sum(pTmp.^2,3);
    p=p+1./hI;
end


if nargout==2
    %
    dp=zeros(sX);
    for itI=1:m
        aI=a(itI,:);
        aR=reshape(aI,1,1,[]);
        pTmp=xx-aR(ones(1,sX(1)),ones(1:sX(2)),:);
        hI=c(itI)+sum(pTmp.^2,3);
        dhI=2*pTmp;
        dp=dp-dhI./hI.^2;
    end
end
end
