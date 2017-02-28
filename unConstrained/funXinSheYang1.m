%% Xin-She-Yang 1 function
% L. LAURENT -- 28/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(0,...,0)=0
%
%Design space -5<xi<5

function [p,dp] = funXinSheYang1(xx)

%constants
sX=size(xx);
ee=rand(sX); % maybe not the right expression rand(1,1,sX(3))

%evaluation and derivatives
li=reshape(1:sX(3),1,1,sX(3));
%
pA=ee.*abs(xx).^li;
%
p=sum(pA,3);

if nargout==2
    dp=ee.*li.*sign(xx).*abs(xx).^(li-1);    
    %debug
end
end

