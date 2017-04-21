%% Brent's function 2
%L. LAURENT -- 13/12/2010 -- luc.laurent@lecnam.net
%
%3 global minima :
%f(x1,x2)=0 for (x1,x2)=(-10,-10)
%
%Design space: -10<x1,x2<10



function [p,dp,infos]=funBrent(xx,dim)

%constants
a=10;

%space
Xmin=[-10 -10];
Xmax=[10,10];
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
        error('The Brent function is a 2 dimensional function');
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
    
    
    p = (xxx+a).^2+(yyy+10).^2+exp(-xxx.^2-yyy.^2);
    
    if nargout==2||dem
        dp(:,:,1)=2*(xxx+a)-2.*xxx.*exp(-xxx.^2-yyy.^2);
        dp(:,:,2)=2*(yyy+a)-2.*yyy.*exp(-xxx.^2-yyy.^2);
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
    infos.min_glob.X=[-10, -10];
    infos.min_glob.Z=0;
    infos.min_loc.Z=NaN;
    infos.min_loc.X=NaN;
end

% demo mode
if nargin==0
    figure
    subplot(1,3,1)
    surf(x,y,p);
    axis('tight','square')
    xlabel('x'), ylabel('y'), title('Brent 2')
    subplot(1,3,2)
    surf(x,y,dp(:,:,1));
    axis('tight','square')
    xlabel('x'), ylabel('y'), title('Grad. X Brent')
    subplot(1,3,3)
    surf(x,y,dp(:,:,2));
    axis('tight','square')
    xlabel('x'), ylabel('y'), title('Grad. Y Brent')
end
end