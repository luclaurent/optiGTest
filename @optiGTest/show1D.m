%% show 1D function
function h=show1D(obj,XX,ZZ,GZ,txt,funName)
nbR=1;
nbC=2;
if nargin<6;funName=[];end
if nargin<5;txt=[];end
%
if iscell(ZZ)
    nbR=numel(ZZ);
else
    ZZ={ZZ};
    GZ={GZ};
end
%
spaceX=[obj.xMin obj.xMax];
%
h=figure('NumberTitle', 'off', 'Name', [txt ' function']);
itS=1;
for itR=1:nbR
    subplot(nbR,nbC,itS)
    plot(XX,ZZ{itR});
    axis('tight','square')
    xlabel('x'), ylabel('F'), title(funName{itR})
    xlim(spaceX)
    subplot(nbR,nbC,itS+1)
    plot(XX,GZ{itR}(:,:,1));
    axis('tight','square')
    xlabel('x'), ylabel('dF/dx'), title(['Grad. ' funName{itR}])
    xlim(spaceX)
    itS=itS+2;
end
end