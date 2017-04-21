%% Bard's function
%L. LAURENT -- 31/10/2016 -- luc.laurent@lecnam.net
%
%one local minimum
%1 global minimum : x=(0.0824, 1.133, 2.3437) >> f(x)=0.00821487
%
%design space -0.25<x1<0.25, 0.01<x2,x3<2.5



function [p,dp,infos]=funBrad(xx,dim)
fprintf('NE TO BE DEBUGGED');
%constants
nbt=15;
u=1:nbt;
v=16-u;
w=min([u',v'],[],2);
y=[0.14, 0.18, 0.22, 0.25, 0.29, 0.32, 0.35, 0.39, 0.37, 0.58, 0.73, 0.96, 1.34, 2.10, 4.39];

%space
Xmin=[-0.25 0.01 0.01];
Xmax=[0.25 2.5 2.5];

%default dimension
if nargin==1;dim=3;end

% demo mode
dem=false;
if nargin==0
fprintf('3-dimensional function (no demo mode\n')
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
        error('The Bard''s function is a 3 dimensional function');
    else
        xxx=xx(:,:,1);
        yyy=xx(:,:,2);
        zzz=xx(:,:,3);
    end
    
    p=zeros(size(xxx));
    for it=1:nbt
        p=p+((y(it)-xxx-u(it))./(v(it).*yyy+w(it).*zzz)).^2;
    end
    if nargout==2||dem
        dp=zeros(size(xxx,1),size(xxx,2),3);
        for it=1:nbt
            mult=(y(it)-xxx-u(it))./(v(it).*yyy+w(it).*zzz);
            dp(:,:,1)=dp(:,:,1)-2./(v(it).*yyy+w(it).*zzz).*mult;
            dp(:,:,2)=dp(:,:,2)-(y(it)-xxx-u(it))*v(it)./(v(it).*yyy+w(it).*zzz).^2.*mult;
            dp(:,:,3)=dp(:,:,3)-(y(it)-xxx-u(it))*w(it)./(v(it).*yyy+w(it).*zzz).^2.*mult;
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
    infos.min_glob.Z=0.00821487;
    infos.min_glob.X=[0.0824,1.133,2.3437];
    infos.min_loc.Z=NaN;
    infos.min_loc.X=NaN;
end

end
