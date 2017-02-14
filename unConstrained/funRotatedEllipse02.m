%% Rotated Ellipse function 2
% L. LAURENT -- 14/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(0,0)=0
%
%Design space -500<xi<500


function [p,dp] = funRotatedEllipse02(xx)

%constants
a=7;
b=6*sqrt(3);
c=13;

%evaluation and derivatives
p=a*xx(:,:,1).^2-b*xx(:,:,1).*xx(:,:,2)+c*xx(:,:,2).^2;


if nargout==2
    %
    dp=zeros(size(xx));
    dp(:,:,1)=2*a*xx(:,:,1)-b*xx(:,:,2);
    dp(:,:,2)=-b*xx(:,:,1)+2*c*xx(:,:,2);
end
end
