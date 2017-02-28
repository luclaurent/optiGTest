%% Rotated Ellipse function 1
% L. LAURENT -- 14/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(0,0)=0
%
%Design space -500<xi<500


function [p,dp] = funRotatedEllipse1(xx)


%evaluation and derivatives
p=xx(:,:,1).^2-xx(:,:,1).*xx(:,:,2)+xx(:,:,2).^2;


if nargout==2
    %
    dp=zeros(size(xx));
    dp(:,:,1)=2*xx(:,:,1)-xx(:,:,2);
    dp(:,:,2)=-xx(:,:,1)+2*xx(:,:,2);
end
end
