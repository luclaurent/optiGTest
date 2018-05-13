%% show 2D function
function h=show2D(obj,XX,YY,ZZ,GZ,txt,funName)
nbC=6;
nbLevel=10;
%
if nargin<6;funName{1}='';end
if nargin<5;txt=[];end
%
if iscell(ZZ)
    nbR=numel(ZZ);
    if numel(funName)==1&&nbR~=1
        funName=repmat({''},1,nbR);
    end
else
    nbR=2;
    nbC=3;
    %
    ZZ={ZZ};
    GZ={GZ};
end
%
spaceX=[obj.xMin(1) obj.xMax(1)];
spaceY=[obj.xMin(2) obj.xMax(2)];
%
h=figure('NumberTitle', 'off', 'Name', [txt ' function']);
itS=1;
warning off all;
for itR=1:numel(ZZ)
    subplot(nbR,nbC,itS)
    surfCustom(XX,YY,ZZ{itR});
    axis('tight','square')
    xlabel('x'), ylabel('y'), title(funName{itR})
    xlim(spaceX)
    ylim(spaceY)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%
    subplot(nbR,nbC,itS+1)
    surfCustom(XX,YY,GZ{itR}(:,:,1));
    axis('tight','square')
    xlabel('x'), ylabel('y'), title(['Grad. X ' funName{itR}])
    xlim(spaceX)
    ylim(spaceY)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%
    subplot(nbR,nbC,itS+2)
    surfCustom(XX,YY,GZ{itR}(:,:,2));
    axis('tight','square')
    xlabel('x'), ylabel('y'), title(['Grad. Y ' funName{itR}])
    xlim(spaceX)
    ylim(spaceY)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%
    subplot(nbR,nbC,itS+3)
    contourf(XX,YY,ZZ{itR},nbLevel);
    axis('tight','square')
    xlabel('x'), ylabel('y'), title(funName{itR})
    xlim(spaceX)
    ylim(spaceY)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%
    subplot(nbR,nbC,itS+4)
    contourf(XX,YY,GZ{itR}(:,:,1),nbLevel);
    axis('tight','square')
    xlabel('x'), ylabel('y'), title(['Grad. X ' funName{itR}])
    xlim(spaceX)
    ylim(spaceY)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%
    subplot(nbR,nbC,itS+5)
    contourf(XX,YY,GZ{itR}(:,:,2),nbLevel);
    axis('tight','square')
    xlabel('x'), ylabel('y'), title(['Grad. Y ' funName{itR}])
    xlim(spaceX)
    ylim(spaceY)
    %
    itS=itS+6;
end
warning on all;
end