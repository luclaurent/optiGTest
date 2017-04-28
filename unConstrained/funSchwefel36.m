%% Schwefel 36 function
%L. LAURENT -- 28/04/2017 -- luc.laurent@lecnam.net
%
%numerous local minima
%1 global minimum : x=(12,12) >> f(x)=-3456
%
%Design space: 0<xi<10

function [p,dp]=funSchwefel36(xx)

%constants
a=72;
b=2;

%evaluation and derivatives
xxx=xx(:,:,1);
yyy=xx(:,:,2);
%
pa=xxx.*yyy;
pb=a-b*xxx-b*yyy;
%
p=-pa.*pb;
%
if nargout==2
    %
    dp=zeros(size(xx));
    %
    dp(:,:,1)=-yyy.*pb+b*pa;
    dp(:,:,2)=-xxx.*pb+b*pa;
end

end
