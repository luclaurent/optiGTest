classdef diffGrad < handle
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        type='FD1';
        Xref;
        XevalG;
        ZevalG;
        GZeval;
        XevalH;
        ZevalH;
        HZeval;
        fun;
        stepsDiff;
        dim;
        nS;
        nX;
    end
    properties (Access=private)
        confFD;
        dupX; %duplicate coordinates of Xeval (for reducing the number of evaluations of the function
    end
    
    methods
        function obj=diffGrad(typeIn,XrefIn,stepsIn,funIn)
            demo=false;
            if isempty(typeIn)
                demo=true;
            else
                obj.type=typeIn;
            end
            obj.Xref=XrefIn;
            obj.stepsDiff=stepsIn;
            %
            if nargin>3;
                obj.fun=funIn;
                if demo
                    obj.runDemo;
                end
            end
            %
            %
        end
        %setters
        function set.Xref(obj,XX)
            obj.Xref=obj.loadX(XX);
        end
        function set.stepsDiff(obj,steps)
            obj.stepsDiff=obj.loadStepsDiff(steps);
        end
        %getters
        function XX=get.XevalG(obj)
            XX=obj.geneXG();
        end
        function ZZ=get.ZevalG(obj)
            ZZ=obj.GcomputeZ;
        end
        function GZ=get.GZeval(obj)
            GZ=obj.computeGZ;
        end
        %functions
        function Xout=loadX(obj,XX)
            Xout=XX;
            obj.dim=size(XX,2);
            obj.nS=size(XX,1);
        end
        %functions
        function stepsOut=loadStepsDiff(obj,steps)
            % deal with specific form of stepsize obj.stepsDiff
            % on row: specific stepsize per dimension
            % on column: specific stepsize per point
            sSteps=size(steps);
            nbR=[1 1];
            if sSteps(1) == 1
                nbR(1)=obj.nS;
            elseif sSteps(1) ~=1 || sSteps(1) ~= obj.nS
                fprintf('Wrong size of the steps for computing finite differences\n');
            end
            if sSteps(2) == 1
                nbR(2)=obj.dim;
            elseif sSteps(2) ~=1 || sSteps(2) ~= obj.nS
                fprintf('Wrong size of the steps for computing finite differences\n');
            end
            stepsOut=repmat(steps,nbR);
        end
        %build coordinates for evaluating the function for gradient
        function XX=geneXG(obj)
            %load configuration
            obj.confFD=loadFD(obj.type);
            %build combination of steps for eveyr dimension
            nbStep=numel(obj.confFD.grad.steps);
            stepsXtmp=[obj.confFD.grad.steps(ones(1,obj.dim),:).';zeros(nbStep,obj.dim)];
            stepsXraw = arrayfun(@(i) circshift(stepsXtmp(:, i), nbStep*(i-1)), 1:obj.dim, 'UniformOutput', false);
            stepsXraw = cell2mat(stepsXraw);
            %build array of points for evaluating the function
            sDiff=obj.stepsDiff;
            XX=zeros(obj.nS*nbStep*obj.dim,obj.dim);
            for itS=1:obj.nS
                nbT=nbStep*obj.dim;
                itX=nbT*(itS-1)+(1:nbT);
                XX(itX,:)=repmat(obj.Xref(itS,:),[nbT 1])+bsxfun(@times,stepsXraw,sDiff(itS,:));
            end
            %remove duplicate and store positions
            [XX,~,obj.dupX]=unique(XX,'rows');
            obj.nX=size(XX,1);
        end
        %load external Z (external evaluation of the function)
        function loadZextG(obj,ZZ)
            if ~isempty(ZZ)
                if numel(ZZ)==obj.nX;
                    obj.ZevalG=ZZ(:);
                else
                    fprintf('Wrong size of external responses (expected: %i, provided: %i\n',obj.nX,numel(ZZ));
                end
            end
        end
        %compute responses of the function at the Xeval points
        function ZZ=GcomputeZ(obj,XX)
            if ~isempty(obj.fun)
                if nargin>1
                    ZZ=feval(obj.fun,XX);
                else
                    ZZ=feval(obj.fun,obj.XevalG);
                end
            else
                fprintf('Undefined function for evaluation\n');
            end
        end
        %compute gradients from responses at the Xeval points
        function GZ=computeGZ(obj)
            %build the right Zeval vector
            ZZevalG=obj.ZevalG;
            ddupX=obj.dupX;
            rZeval=repmat(ZZevalG(ddupX),[1,obj.dim]);
            %load coef and divisor
            coefG=obj.confFD.grad.coef;
            nbCoef=numel(coefG);
            divG=obj.confFD.grad.div;
            %build array of coefficients
            coefTmp=[coefG(ones(1,obj.dim),:).';zeros(nbCoef,obj.dim)];
            coefRaw = arrayfun(@(i) circshift(coefTmp(:, i), nbCoef*(i-1)), 1:obj.dim, 'UniformOutput', false);
            coefRaw = cell2mat(coefRaw);
            %product coef*response
            prodZCoef=rZeval.*repmat(coefRaw,[obj.nS,1]);
            %build the array of gradients
            GZ=zeros(obj.nS,obj.dim);
            for itS=1:obj.nS
                nbT=nbCoef*obj.dim;
                itX=nbT*(itS-1)+(1:nbT);
                GZ(itS,:)=sum(prodZCoef(itX,:),1)./divG;
            end
        end
        %demo mode 
        function runDemo(obj)
            %load list of available finite differences
            listT=fieldnames(loadFD);
            GZdemo=cell(1,numel(listT));
            for itT=1:numel(listT)
                obj.type=listT{itT};
                GZdemo{itT}=obj.computeGZ;
            end
            fprintf('Display of the results from the available FD technics\n')
            for itT=1:numel(listT)
                fprintf('%s: ',listT{itT});
                if size(GZdemo{1},1)>1;fprintf('\n');end
                for iTG=1:size(GZdemo{itT},1)
                   fprintf('%d ',GZdemo{itT}(iTG,:));
                   fprintf('\n');
                end
            end
        end
    end
    
end

%available finite differences approachs
function R=loadFD(typeIn)
%available technics and parameters
listFD.FD1.grad.steps=[0 1];
listFD.FD1.grad.coef=[-1 1];
listFD.FD1.grad.div=1;
listFD.FD1.hess.steps=[0 1 2];
listFD.FD1.hess.coef=[1 -2 1];
listFD.FD1.hess.div=1;
%
listFD.BD1.grad.steps=[-1 0];
listFD.BD1.grad.coef=[-1 1];
listFD.BD1.grad.div=1;
listFD.BD1.hess.steps=[-2 -1 0];
listFD.BD1.hess.coef=[1 -2 1];
listFD.BD1.hess.div=1;
%
listFD.FD2.grad.steps=[0 1 2];
listFD.FD2.grad.coef=[-3 4 -1];
listFD.FD2.grad.div=2;
listFD.FD2.hess.steps=[0 1 2 3];
listFD.FD2.hess.coef=[2 -5 4 -1];
listFD.FD2.hess.div=1;
%
listFD.BD2.grad.steps=[-2 -1 0];
listFD.BD2.grad.coef=[1 -4 3];
listFD.BD2.grad.div=2;
listFD.BD2.hess.steps=[-3 -2 -1 0];
listFD.BD2.hess.coef=[-1 4 -5 2];
listFD.BD2.hess.div=1;
%
listFD.CD2.grad.steps=[-1 1];
listFD.CD2.grad.coef=[-1 1];
listFD.CD2.grad.div=2;
listFD.CD2.hess.steps=[-1 0 1];
listFD.CD2.hess.coef=[1 -2 1];
listFD.CD2.hess.div=1;
%
listFD.FD4.grad.steps=[-1 0 1 2 3];
listFD.FD4.grad.coef=[-3 -10 18 -6 1];
listFD.FD4.grad.div=12;
listFD.FD4.hess.steps=[NaN];
listFD.FD4.hess.coef=[NaN];
listFD.FD4.hess.div=NaN;
%
listFD.BD4.grad.steps=[-3 -2 -1 0 1];
listFD.BD4.grad.coef=[-1 6 -18 10 3];
listFD.BD4.grad.div=12;
listFD.BD4.hess.steps=[NaN];
listFD.BD4.hess.coef=[NaN];
listFD.BD4.hess.div=NaN;
%
listFD.CD4.grad.steps=[-2 -1 1 2];
listFD.CD4.grad.coef=[1 -8 8 -1];
listFD.CD4.grad.div=12;
listFD.CD4.hess.steps=[-2 -1 0 1 2];
listFD.CD4.hess.coef=[-1 16 -30 16 -1];
listFD.CD4.hess.div=12;
%
if nargin==0
    typeIn=[];
end
%
if ~isempty(typeIn)
    listT=fieldnames(listFD);
    if ismember(typeIn,listT)
        R=listFD.(typeIn);
    else
        fprintf('Wrong type of finite differences\n');
        fprintf('Available technics:\n');
        cellfun(@(X)fprintf('%s\n',X),listT);
    end
else
    R=listFD;
end
end
