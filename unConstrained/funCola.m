%% Colas's function
%L. LAURENT -- 04/11/2016 -- luc.laurent@lecnam.net
%
%numerous local minima
%1 global minimum : x=(0.651906,1.30194,0.099242,?0.883791,?0.8796, 
%               0.204651,-3.28414,0.851188,-3.46245,2.53245,-0.895246,
%               0.204651,-3.28414,0.851188,-3.46245,2.53245,-0.895246,
%               1.40992,-3.07367,1.96257,-2.97872,?0.807849,-1.68978) >> f(x)=11.7464
%
%design space -1<xi<4


function [p,dp]=funCola(xx)
fprintf('NEED to FIXED')
%cf. https://github.com/andyfaff/ampgo/blob/master/%20ampgo%20--username%20andrea.gavana%40gmail.com/go_benchmark.py

%constant
dd=[0    0    0    0    0    0    0    0    0
    1.27 0    0    0    0    0    0    0    0
    1.69 1.43 0    0    0    0    0    0    0
    2.04 2.35 2.45 0    0    0    0    0    0
    3.09 3.18 3.26 2.85 0    0    0    0    0
    3.20 3.22 3.27 2.88 1.55 0    0    0    0
    2.86 2.56 2.58 2.59 3.12 3.06 0    0    0
    3.17 3.18 3.18 3.12 1.31 1.64 3.00 0    0
    3.21 3.18 3.18 3.17 1.70 1.36 2.95 1.32 0
    2.38 2.31 2.42 1.94 2.85 2.81 2.56 2.91 2.97];
%handle function
funR=@(xi,xj,yi,yj)sqrt((xi-xj).^2+(yi-yj).^2);

%evaluation and derivatives
nS=[size(xx,1) size(xx,2) size(xx,3)];
%
zz=zeros(nS(1),nS(2));
xC=cat(3,zz,xx(:,:,1:2:end));
yC=cat(3,zz,zz,xx(:,:,2:2:end));
%
p=zeros(nS(1:2));
for itI=1:size(xC,3)
    for itJ=1:itI-1
       % dd(itI,itJ)
        p=p+(funR(xC(:,:,itI),xC(:,:,itJ),yC(:,:,itI),yC(:,:,itJ))-dd(itI,itJ)).^2;
       % p
    end
end

if nargout==2
    fprintf('Derivatives not implemented')
    dp=zeros(nS);
 %   dp=4*xx.*repmat(pSum,[1 1 size(xx,3)]);
end
end
