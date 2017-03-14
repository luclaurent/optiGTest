%% AMGM function (Arthmetic Mean - Geometric Mean)
%L. LAURENT -- 13/03/2017 -- luc.laurent@lecnam.net
%
%global minimum : f(x)=0 for x1=x2=x3=...=xn
%
%Design space: 0<xi<10


function [p,dp]=funAMGM(xx)

%variables
dim=size(xx,3);

%evaluation and derivatives
pa=sum(xx,3);
pb=prod(xx,3);
pc=1/dim*pa-pb.^(1/dim);
%
p=pc.^2;

if nargout==2
    %
    funP=@(i)prod(xx(:,:,[1:i-1 i+1:end]),3);
    pdA=arrayfun(funP,1:dim,'UniformOutput',false);
    pdA=cell2mat(reshape(pdA,1,1,dim));
    %
    pdB=1/dim-pdA.*pb.^(1/dim-1)./dim;
    %
    dp=2*pdB.*pc;
end
end
