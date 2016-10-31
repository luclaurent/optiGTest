%% Brent's function 2
%L. LAURENT -- 13/12/2010 -- luc.laurent@lecnam.net
%
%3 global minima :
%f(x1,x2)=0 for (x1,x2)=(-10,-10)
%
%Design space: -10<x1,x2<10

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