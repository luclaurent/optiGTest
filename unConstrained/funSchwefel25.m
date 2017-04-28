%% Schwefel 25 function
%L. LAURENT -- 28/04/2017 -- luc.laurent@lecnam.net
%
%numerous local minima
%1 global minimum : x=(1,1,...,1) >> f(x)=0
%
%Design space: 0<xi<10

function [p,dp]=funSchwefel25(xx)

%constants
a=1;

%evaluation and derivatives
pa=xx-a;
pb=bsxfun(@minus,xx(:,:,1),xx.^2);
%
p=sum(pa.^2+pb.^2,3);
%
if nargout==2
    %
    dp=2*pa-4*xx.*pb;
    %
    dp(:,:,1)=dp(:,:,1)+sum(2*pb,3);
end

end
