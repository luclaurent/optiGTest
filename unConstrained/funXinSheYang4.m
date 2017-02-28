%% Xin-She-Yang 4 function
% L. LAURENT -- 28/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(0,...,0)=-1
%
%Design space -10<xi<10

function [p,dp] = funXinSheYang4(xx)


%evaluation and derivatives
pa=sin(xx);
pAA=sum(pa.^2,3);
%
pb=xx.^2;
pB=sum(pb,3);
pBB=exp(-pB);
%
pc=sin(sqrt(abs(xx)));
pC=sum(pc.^2,3);
pCC=exp(-pC);
%
p=(pAA-pBB).*pCC;

if nargout==2
    dp=2*(pa.*cos(xx)+xx.*pBB).*pCC ...
        -(pAA-pBB).*sign(xx)./sqrt(abs(xx)).*pc.*cos(sqrt(abs(xx))).*pCC;
end
end

