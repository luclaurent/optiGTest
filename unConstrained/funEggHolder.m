%% Egg Holder function
%L. LAURENT -- 16/11/2016 -- luc.laurent@lecnam.net
%
%one local minimum
%1 global minimum : x=(512.0, 404.2319) >> f(x)=-959.640662711
%
%design space -512<xi<512


function [p,dp]=funEggHolder(xx)

%constants
a=47;
b=0.5;

%variables
dim=size(xx,3);

%evaluations and derivatives
pa=xx(:,:,2:end)+a;
pb=xx(:,:,2:end)+xx(:,:,1:end-1).*0.5+a;
pc=xx(:,:,1:end-1)-xx(:,:,2:end)-a;
%
sqpb=sqrt(abs(pb));
sqpc=sqrt(abs(pc));
sipb=sin(sqpb);
sipc=sin(sqpc);
%
g=-pa.*sipb-xx(:,:,1:end-1).*sipc;
p=sum(g,3);

if nargout==2
    dgi=-b*pa.*sign(pb).*1./(2*sqpb).*cos(sqpb)...
        -sipc...
        -xx(:,:,1:end-1).*sign(pc).*1./(2*sqpc).*cos(sqpc);
    dgii=-sipb...
        -pa.*sign(pb).*1./(2*sqpb).*cos(sqpb)...
        +xx(:,:,1:end-1).*sign(pc).*1./(2*sqpc).*cos(sqpc);
    %    
    dp=zeros(size(xx));
    dp(:,:,1)=dgi(:,:,1);    
    for it=2:dim-1
        dp(:,:,it)=dgi(:,:,it)+dgii(:,:,it-1);
    end    
    dp(:,:,dim)=dgii(:,:,end);
end
end