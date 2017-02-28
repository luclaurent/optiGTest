%% Ursem 1 function
% L. LAURENT -- 24/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(1.69714,0)=-4.8168
%
%Design space -2.5<x1<3 -2<x<2

function [p,dp] = funUrsem01(xx)

%constants
a=2;
b=pi/2;
c=3;
d=1/2;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
%
pa=-sin(a*x-b);
pb=-c*cos(y);
%
p=pa+pb-d*x;

if nargout==2
    %
    dp=zeros(size(xx));
    %
    dp(:,:,1)=-a*cos(a*x-b)-d;
    dp(:,:,2)=c*sin(y);      
end
end

