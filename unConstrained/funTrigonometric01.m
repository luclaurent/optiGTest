%% Trigonometric 1 function
% L. LAURENT -- 23/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(0,...,0)=0
%
%Design space 0<xi<pi


function [p,dp] = funTrigonometric01(xx)

%constants
nbvar=size(xx,3);

%evaluation and derivatives
cx=cos(xx);
sx=sin(xx);
%
lI=reshape(1:nbvar,1,1,nbvar);
%
sumcx=sum(cx+lI.*(1-cx-sx),3);
%
pa=nbvar-sumcx(:,:,ones(1,nbvar));
%
p=sum(pa.^2,3);

if nargout==2
    %
    dp=2*pa.*(sx+lI.*(-sx+cx))*nbvar;
end
end
