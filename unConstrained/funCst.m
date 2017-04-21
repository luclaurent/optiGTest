%% Constant function
% L. LAURENT -- 20/10/2011 -- luc.laurent@lecnam.net


function [p,dp,infos]=funCst(xx,dim)

% demo mode
dem=false;
if nargin==0
    pas=50;
    borne=10;
    [x,y]=meshgrid(linspace(-borne,borne,pas));
    xx=zeros(pas,pas,2);
    xx(:,:,1)=x;xx(:,:,2)=y;
    dem=true;
end
if ~isempty(xx)
    % number of design variables
    nbvar=size(xx,3);
    
    %valeur constant
    val=10;
    
    if nbvar==1
        if size(xx,2)==2
            xxx=xx(:,1);
        elseif size(xx,1)==2
            xxx=xx(:,2);
        else
            error(['Wrong input variables ',mfilename]);
        end
        p=val*ones(size(xxx));
        if nargout==2
            dp=zeros(size(xx));
        end
        
    else
        p=val*ones(size(xx(:,:,1)));
        if nargout==2
            dp=zeros(size(xx));
        end
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
    pts=NaN;
    infos.min_glob.X=pts;
    infos.min_glob.Z=NaN;
    infos.min_loc.Z=infos.min_glob.Z;
    infos.min_loc.X=pts;
end
end