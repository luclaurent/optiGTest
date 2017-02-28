%% Trigonometric 2 function
% L. LAURENT -- 23/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(0.9,...,0.9)=1
%
%Design space -500<xi<500 (focus on 0<xi<2)


function [p,dp] = funTrigonometric2(xx)

%constants
a=1;
b=8;
c=7;
d=0.9;
e=6;
f=14;

%evaluation and derivatives
xd=xx-d;
xd2=xd.^2;
scx=sin(c*xd2);
sfx=sin(f*xd2);
%
pa=b*scx.^2;%+e*sfx.^2+xd2;
%
p=a+sum(pa,3);

if nargout==2
    %
    ccx=cos(c*xd2);
    cfx=cos(f*xd2);
    %
    dp=4*b*c*xd.*ccx.*scx; ...
        +4*e*f*xd.*cfx.*sfx ...
        +2*xd;
end
end
