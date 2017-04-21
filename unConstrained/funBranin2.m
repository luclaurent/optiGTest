%% Branin's function 2
%L. LAURENT -- 13/12/2010 -- luc.laurent@lecnam.net
%
%3 global minima :
%f(x1,x2)=5.559037 for (x1,x2)=(?3.2,12.53)
%
%Design space: -5<x1,x2<15



function [p,dp,infos]=funBranin2(xx,dim)

%constants
a=5.1/(4*pi^2);
b=5/pi;
c=6;
d=10;
e=1/(8*pi);

%space
Xmin=[-5 0];
Xmax=[10,15];
% demo mode
dem=false;
if nargin==0
    stepM=50;
    XX=linspace(Xmin(1),Xmax(1),stepM);
    YY=linspace(Xmin(2),Xmax(2),stepM);
    [x,y]=meshgrid(XX,YY);
    xx=zeros(stepM,stepM,2);
    xx(:,:,1)=x;xx(:,:,2)=y;
    dem=true;
end
if ~isempty(xx)
    if size(xx,3)>2
        error('The Branin function is a 2 dimensional function');
    elseif size(xx,3)==1
        if size(xx,2)==2
            xxx=xx(:,1);yyy=xx(:,2);
        elseif size(xx,1)==2
            xxx=xx(:,2);yyy=xx(:,1);
        else
            error(['Wrong input variables ',mfilename]);
        end
        
    else
        xxx=xx(:,:,1);yyy=xx(:,:,2);
    end
    
    
    p = (yyy-a*xxx.^2+b*xxx-c).^2+d*(1-e)*cos(xxx).*cos(yyy).*log(xxx.^2+yyy.^2+1)+d;
    
    if nargout==2||dem
        dp(:,:,1)=2*(yyy-a*xxx.^2+b*xxx-c).*(b-2*a*xxx)...
            -d*(1-e)*sin(xxx).*cos(yyy).*log(xxx.^2+yyy.^2+1)...
            +2*xxx./(xxx.^2+yyy.^2+1)*d*(1-e).*cos(xxx).*cos(yyy);
        dp(:,:,2)=2*(yyy-a*xxx.^2+b*xxx-c)...
            -d*(1-e)*cos(xxx).*sin(yyy).*log(xxx.^2+yyy.^2+1)...
            +2*yyy./(xxx.^2+yyy.^2+1)*d*(1-e).*cos(xxx).*cos(yyy);
    end
else
    if nargin==2
        nbvar=dim;
    end
    p=[];
    dp=[];
end
% output: information about the function
if nargout==3
    infos.Xmin=Xmin;
    infos.Xmax=Xmax;
    infos.min_glob.X=[-3.2,12.53];
    infos.min_glob.Z=5.559037;
    infos.min_loc.Z=NaN;
    infos.min_loc.X=NaN;
end

% demo mode
if nargin==0
    figure
    subplot(1,3,1)
    surf(x,y,p);
    axis('tight','square')
    xlabel('x'), ylabel('y'), title('Branin 2')
    subplot(1,3,2)
    surf(x,y,dp(:,:,1));
    axis('tight','square')
    xlabel('x'), ylabel('y'), title('Grad. X Branin 2')
    subplot(1,3,3)
    surf(x,y,dp(:,:,2));
    axis('tight','square')
    xlabel('x'), ylabel('y'), title('Grad. Y Branin 2')
end
end