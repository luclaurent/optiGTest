%% Rana function
%L. LAURENT -- 21/11/2016 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=0-928.5478 for xi=-500
%
%Design space: -500<xi<500


function [p,dp]=funRana(xx)

%constants
a=1;

%evaluation and derivatives
pa=xx(:,:,2:end)+xx(:,:,1:end-1)+a;
pb=xx(:,:,2:end)-xx(:,:,1:end-1)+a;
ta=sqrt(abs(pa));
tb=sqrt(abs(pb));
pc=(xx(:,:,2:end)+a).*cos(tb).*sin(ta)+xx(:,:,1:end-1).*cos(ta).*sin(tb);
%
p=sum(abs(pc),3);

if nargout==2    
    %dp=%(5*xx.^4-4*a*xx.^3+3*b*xx.^2+2*c*xx-d).*sign(pa);
end
end
