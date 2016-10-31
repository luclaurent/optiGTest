%% Branin's function 1
%L. LAURENT -- 13/12/2010 -- luc.laurent@lecnam.net
%
%3 global minima :
%f(x1,x2)=0 for (x1,x2)={(-pi,12.275),(pi,2.275),(3*pi,2.475)}
%
%Design space: -5<x1<10, 0<x2<15

%     GRENAT - GRadient ENhanced Approximation Toolbox
%     A toolbox for generating and exploiting gradient-enhanced surrogate models
%     Copyright (C) 2016  Luc LAURENT <luc.laurent@lecnam.net>
%
%     This program is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
%
%     This program is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
%
%     You should have received a copy of the GNU General Public License
%     along with this program.  If not, see <http://www.gnu.org/licenses/>.

function [p,dp,infos]=funBranin1(xx,dim)

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
    
    
    p = (yyy-a*xxx.^2+b*xxx-c).^2+d*(1-e)*cos(xxx)+d;
    
    if nargout==2||dem
        dp(:,:,1)=2*(yyy-a*xxx.^2+b*xxx-c).*(b-2*a*xxx)-d*(1-e)*sin(xxx);
        dp(:,:,2)=2*(yyy-a*xxx.^2+b*xxx-c);
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
    pts=[-pi,12.275;pi,2.275;3*pi,2.475];
    infos.Xmin=Xmin;
    infos.Xmax=Xmax;
    infos.min_glob.X=pts;
    infos.min_glob.Z=a*(pts(:,2)-b*pts(:,1).^2+c*pts(:,1)-d).^2+e*(1-f)*cos(pts(:,1))+e;
    infos.min_loc.Z=[0;0;0];
    infos.min_loc.X=pts;
end

% demo mode
if nargin==0
    figure
    subplot(1,3,1)
    surf(x,y,p);
    axis('tight','square')
    xlabel('x'), ylabel('y'), title('Branin')
    subplot(1,3,2)
    surf(x,y,dp(:,:,1));
    axis('tight','square')
    xlabel('x'), ylabel('y'), title('Grad. X Branin')
    subplot(1,3,3)
    surf(x,y,dp(:,:,2));
    axis('tight','square')
    xlabel('x'), ylabel('y'), title('Grad. Y Branin')
end
end