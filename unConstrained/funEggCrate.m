%% Egg Crate's function
%L. LAURENT -- 15/11/2016 -- luc.laurent@lecnam.net
%
%global minimum : f(x1,x2)=0 for (0,0)
%
%Design space: -5<xi<5


function [p,dp]=funEggCrate(xx)

%constants
a=25;

%variables
xxx=xx(:,:,1);
yyy=xx(:,:,2);

%evaluation and derivatives
sx=sin(xxx);
sy=sin(yyy);
p=xxx.^2+yyy.^2+a*(sx.^2+sy.^2);
%
if nargout==2
    cx=cos(xxx);
    cy=cos(yyy);
    %
    dp(:,:,1)=2*xxx+2*a*cx.*sx;
    dp(:,:,2)=2*yyy+2*a*cy.*sy;
end
end