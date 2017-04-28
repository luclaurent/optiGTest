%% Ursem 3 function
% L. LAURENT -- 24/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(0,0)=-4.8168
%
%Design space -2<x1<2 -1.5<x<1.5

function [p,dp] = funUrsem3(xx)

%constants
a=2.2*pi;
b=pi/2;
c=2;
d=3;

%evaluation and derivatives
pa=-sin(a*xx+b);
pb=(c-abs(xx))./c;
pc=(d-abs(xx))./c;
%
pt=pa.*pb.*pc;
%
p=sum(pt,3);
%
if nargout==2
    %
    dpa=-a*cos(a*xx+b);
    dpb=-sign(xx)./c;
    dpc=-sign(xx)./c;
    %
    dp=dpa.*pb.*pc+pa.*dpb.*pc+pa.*pb.*dpc;
end
end

