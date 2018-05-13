%% run demo mode (only for 1D or 2D function)
function hh=demo(obj)
if isinf(obj.dimAvailable);obj.dim=2;end
Xmin=obj.xMin;
Xmax=obj.xMax;
% plot 1D or 2D
if obj.dim==1
    stepM=100;
    %
    xx=linspace(Xmin(1),Xmax(1),stepM);
    %evaluation of objective function(s)
    [ZZobj,GZobj]=obj.evalObj(xx);
    %display
    hh(1)=obj.show1D(xx,ZZobj,GZobj,[obj.namePb ': Objective'],obj.funObj);
    %constraint(s)
    if obj.nbCons>1
        %evaluation of constraint function(s)
        [ZZcons,GZcons]=obj.evalCons(xx);
        %display
        hh(2)=obj.show1D(xx,ZZcons,GZcons,[obj.namePb ': Constraint'],obj.funCons);
    end
    %store figure handle
    obj.figureHandle=hh;
elseif any(ismember(obj.dimAvailable,2))||isinf(obj.dimAvailable)
    obj.dim=2;
    stepM=51;
    %
    xL=linspace(Xmin(1),Xmax(1),stepM);
    yL=linspace(Xmin(2),Xmax(2),stepM);
    [x,y]=meshgrid(xL,yL);
    xx=zeros(stepM,stepM,2);
    xx(:,:,1)=x;xx(:,:,2)=y;
    %evaluation of objective function(s)
    [ZZobj,GZobj]=obj.evalObj(xx);
    %display
    hh(1)=obj.show2D(x,y,ZZobj,GZobj,[obj.namePb ': Objective'],obj.funObj);
    %constraint(s)
    if obj.nbCons>1
        %evaluation of constraint function(s)
        [ZZcons,GZcons]=obj.evalCons(xx);
        %display
        hh(2)=obj.show2D(x,y,ZZcons,GZcons,[obj.namePb ': Constraint'],obj.funCons);
    end
    %store figure handle
    obj.figureHandle=hh;
else
    fprintf(['Too large dimension to be plotted (' mfilename ')\n']);
end
end