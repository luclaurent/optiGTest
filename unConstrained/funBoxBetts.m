%% Box-Betts Quadratic Sum function
%L. LAURENT -- 31/10/2016 -- luc.laurent@lecnam.net
%
%one local minimum
%1 global minimum : x=(1, 10, 1) >> f(x)=0
%
%design space 0.9<x1,x3<1.2 and 9<x2<11.2



function [p,dp,infos]=funBoxBetts(xx,dim)

fprintf('TO BE FIXED')

%constants
a=0.1;
nbt=10;

%space
Xmin=[0.9 9 0.9];
Xmax=[1.2 11.2 1.2];

%default dimension
if nargin==1;dim=3;end

% demo mode
dem=false;
if nargin==0
fprintf('3-dimensional function (no demo mode\n')
xx=[];
end
if ~isempty(xx)
    %number of design variables
    nbvar=size(xx,3);
    if nbvar==1
        if size(xx,2)==3
            xxx=xx(:,1);yyy=xx(:,2);zzz=xx(:,3);
        elseif size(xx,1)==3
            xxx=xx(1,:);yyy=xx(2,:);zzz=xx(3,:);
        else
            error(['Wrong input variables ',mfilename]);
        end
    elseif nbvar==2||nbvar>3
        error('The BBox-Betts Quadratic Sum function is a 3 dimensional function');
    else
        xxx=xx(:,:,1);
        yyy=xx(:,:,2);
        zzz=xx(:,:,3);
    end
        
    p=zeros(size(xxx));
    funG=@(x1,x2,x3,j)exp(-a*j.*x1)-exp(-a*j.*x2)-(exp(-a*j)-exp(-j)).*x3;
    for it=1:nbt
        p=p+funG(xxx,yyy,zzz,it).^2;
    end
    if nargout==2||dem
        dp=zeros(size(xxx,1),size(xxx,2),3);
        for it=1:nbt
            dp(:,:,1)=dp(:,:,1)-a*it*exp(-a*it.*xxx);
            dp(:,:,2)=dp(:,:,2)+a*it*exp(-a*it.*yyy);
            dp(:,:,3)=dp(:,:,3)-exp(-a*it)+exp(-it);
        end
    end
else
    if nargin==2
        nbvar=dim;
    end
    p=[];
    dp=[];
end
%output of information about the function
if nargout==3
    infos.Xmin=Xmin;
    infos.Xmax=Xmax;
    infos.min_glob.Z=0;
    infos.min_glob.X=[1, 10, 5];
    infos.min_loc.Z=NaN;
    infos.min_loc.X=NaN;
end

end
