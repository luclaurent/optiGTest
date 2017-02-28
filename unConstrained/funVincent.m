%% Vincent function
% L. LAURENT -- 27/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(7.70628098,...,7.70628098)=-n
%
%Design space 0.25<xi<10

function [p,dp] = funVincent(xx)

%constants
a=10;
%evaluation and derivatives
%
ll=log(xx);
sl=sin(a*ll);
%
p=-sum(sl,3);

if nargout==2
    %
    dp=-a./xx.*cos(a*ll);
end
end

