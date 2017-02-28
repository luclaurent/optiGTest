%% Xor function
% L. LAURENT -- 28/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(1,-1,1,-1,-1,1,1,-1,0.421134)=0.9597588
%
%Design space -9<xi<9

function [p,dp] = funXor(xx)

%evaluation and derivatives
x1=xx(:,:,1);
x2=xx(:,:,2);
x3=xx(:,:,3);
x4=xx(:,:,4);
x5=xx(:,:,5);
x6=xx(:,:,6);
x7=xx(:,:,7);
x8=xx(:,:,8);
x9=xx(:,:,9);
%
p125=exp(-x1-x2-x5);
p346=exp(-x3-x4-x6);
p5=exp(-x5);
p6=exp(-x6);
p15=exp(-x1-x5);
p36=exp(-x3-x6);
p25=exp(-x2-x5);
p46=exp(-x4-x6);
%
pae=exp(-x7./(1+p125)-x8./(1+p346)-x9);
pa=1+pae;
pbe=exp(-x7./(1+p5)-x8./(1+p6)-x9);
pb=1+pbe;
pce=exp(-x7./(1+p15)-x8./(1+p36)-x9);
pc=1+pce;
pcc=1-pc.^(-1);
pde=exp(-x7./(1+p25)-x8./(1+p46)-x9);
pd=1+pde;
pdd=1-pd.^(-1);
%
p=1./pa.^2;%+1./pb.^2+pcc.^2+pdd.^2;
p=pa.^2;
if nargout==2
    dp=zeros(size(xx));
    %
    p125d1=-p125;
    p125d2=-p125;
    p125d5=-p125;
    %
    p346d3=-p346;
    p346d4=-p346;
    p346d6=-p346;
    %
    p5d=-p5;
    %
    p6d=-p6;
    %
    p15d1=-p15;
    p15d5=-p15;
    %
    p36d3=-p36;
    p36d6=-p36;
    %
    p25d2=-p25;
    p25d5=-p25;
    %
    p46d4=-p46;
    p46d6=-p46;
    %
    pad1=x7.*p125d1./(1+p125).^2.*pae.*pa;
    pad2=x7.*p125d2./(1+p125).^2.*pae;
    pad3=x8.*p346d3./(1+p346).^2.*pae;
    pad4=x8.*p346d4./(1+p346).^2.*pae;
    pad5=x7.*p125d5./(1+p125).^2.*pae;
    pad6=x8.*p346d6./(1+p346).^2.*pae;
    pad7=-pae./(1+p125);
    pad8=-pae./(1+p346);
    pad9=-pae;
    %
    pbd5=-x7.*p5d./(1+p5).^2.*pbe;
    pbd6=-x8.*p5d./(1+p6).^2.*pbe;
    pbd7=-pbe./(1+p5);
    pbd8=-pbe./(1+p6);
    pbd9=-pbe;
    %
    pcd1=-x7.*p15d1./(1+p15).^2.*pce;
    pcd3=-x8.*p36d3./(1+p36).^2.*pce;
    pcd5=-x7.*p15d5./(1+p15).^2.*pce;
    pcd6=-x8.*p36d6./(1+p36).^2.*pce;
    pcd7=-pce./(1+p15);
    pcd8=-pce./(1+p36);
    pcd9=-pce;
    %
    pccd1=pcd1./pcc.^2;
    pccd3=pcd3./pcc.^2;
    pccd5=pcd5./pcc.^2;
    pccd6=pcd6./pcc.^2;
    pccd7=pcd7./pcc.^2;
    pccd8=pcd8./pcc.^2;
    pccd9=pcd9./pcc.^2;
    %
    pdd2=-x7.*p25d2./(1+p25).^2.*pde;
    pdd4=-x8.*p46d4./(1+p46).^2.*pde;
    pdd5=-x7.*p25d5./(1+p25).^2.*pde;
    pdd6=-x8.*p46d6./(1+p46).^2.*pde;
    pdd7=-pce./(1+p25);
    pdd8=-pce./(1+p46);
    pdd9=-pce;
    %
    pddd2=pdd2./pcc.^2;
    pddd4=pdd4./pcc.^2;
    pddd5=pdd5./pcc.^2;
    pddd6=pdd6./pcc.^2;
    pddd7=pdd7./pcc.^2;
    pddd8=pdd8./pcc.^2;
    pddd9=pdd9./pcc.^2;
    %
        dp(:,:,1)=pad1;
    dp(:,:,2)=pad2;
    dp(:,:,3)=pad3;
    dp(:,:,4)=pad4;
    dp(:,:,5)=pad5;
    dp(:,:,6)=pad6;
    dp(:,:,7)=pad7;
    dp(:,:,8)=pad8;
    dp(:,:,9)=pad9;


%     dp(:,:,1)=2.*pad1./pa.^3;%+2*pccd1.*pcc;
%     dp(:,:,2)=2.*pad2./pa.^3;%+2*pddd2.*pdd;
%     dp(:,:,3)=2.*pad3./pa.^3;%+2*pccd3.*pcc;
%     dp(:,:,4)=2.*pad4./pa.^3;%+2*pddd4.*pdd;
%     dp(:,:,5)=2.*pad5./pa.^3;%-2*pbd5./pb.^3+2*pccd5.*pcc+2*pddd5.*pdd;
%     dp(:,:,6)=2.*pad6./pa.^3;%-2*pbd6./pb.^3+2*pccd6.*pcc+2*pddd6.*pdd;
%     dp(:,:,7)=2.*pad7./pa.^3;%-2*pbd7./pb.^3+2*pccd7.*pcc+2*pddd7.*pdd;
%     dp(:,:,8)=2.*pad8./pa.^3;%-2*pbd8./pb.^3+2*pccd8.*pcc+2*pddd8.*pdd;
%     dp(:,:,9)=2.*pad9./pa.^3;%-2*pbd9./pb.^3+2*pccd9.*pcc+2*pddd9.*pdd;
end
end

