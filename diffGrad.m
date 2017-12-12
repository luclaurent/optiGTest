%% diffGrad class for computing gradients using finite differences
% L. LAURENT --  12/12/2017 -- luc.laurent@lecnam.net

% optiGTest - set of testing functions    A toolbox to easy manipulate functions.
% Copyright (C) 2017  Luc LAURENT <luc.laurent@lecnam.net>
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.


classdef diffGrad < handle
    
    properties
        type='FD1';     % type of finite difference
        Xref;           % sample points on which the gradients will be calculated
        XevalG;         % points used for computing FD
        ZevalG;         % responses used for computing FD
        GZeval;         % values of gradients
        XevalH;         % points used for computing hessians with FD
        ZevalH;         % responses used for computing hessians with FD
        HZeval;         % values of hessians
        fun;            % considered function
        stepsDiff;      % steps of FD
        dim;            % dimension (number of design variables)
        nS;             % number of sample points
        nX;             % number of points used for compute FD (duplicate points are removed)
    end
    properties (Access=private)
        confFD;         % configuration of the chosen scheme used for FD
        dupX;           % duplicate coordinates of Xeval (for reducing the number of evaluations of the function
    end
    
    methods
        %% constructor of finite differences class
        % INPUTS: 
        % - typeIn: type of FD
        % - XrefIn: point on which the gradients will be calculated
        % - stepsIn: step(s) used for FD
        % - funIn: handle function (@(x) ...)
        function obj=diffGrad(typeIn,XrefIn,stepsIn,funIn)
            %activate or not demo mode
            demo=false;
            if isempty(typeIn)
                demo=true;
            else
                obj.type=typeIn;
            end
            obj.Xref=XrefIn;
            obj.stepsDiff=stepsIn;
            %
            if nargin>3
                obj.fun=funIn;
                if demo
                    obj.runDemo;
                end
            end
            %
            %
        end
        %% setters
        function set.Xref(obj,XX)
            obj.Xref=obj.loadX(XX);
        end
        function set.stepsDiff(obj,steps)
            obj.stepsDiff=obj.loadStepsDiff(steps);
        end
        %% getters
        function XX=get.XevalG(obj)
            XX=obj.geneXG();
        end
        function ZZ=get.ZevalG(obj)
            ZZ=obj.GcomputeZ;
        end
        function GZ=get.GZeval(obj)
            GZ=obj.computeGZ;
        end
        %% load sample points
        function Xout=loadX(obj,XX)
            Xout=XX;
            obj.dim=size(XX,2);
            obj.nS=size(XX,1);
        end
        %% load the steps for FD
        function stepsOut=loadStepsDiff(obj,steps)
            % deal with specific form of stepsize obj.stepsDiff
            % on row: specific stepsize per dimension
            % on column: specific stepsize per point
            sSteps=size(steps);
            nbR=[1 1];
            if sSteps(1) == 1
                nbR(1)=obj.nS;
            elseif sSteps(1) ~=1 || sSteps(1) ~= obj.nS
                keyboard
                fprintf(['Wrong size of the steps for computing finite differences (' mfilename ')\n']);
            end
            if sSteps(2) == 1
                nbR(2)=obj.dim;
            elseif sSteps(2) ~=1 || sSteps(2) ~= obj.nS
                keyboard
                fprintf(['Wrong size of the steps for computing finite differences (' mfilename ')\n']);
            end
            stepsOut=repmat(steps,nbR);
        end
        %% build coordinates for evaluating the function for gradient
        function XX=geneXG(obj)
            %load configuration
            obj.confFD=loadFD(obj.type);
            %build combination of steps for eveyr dimension
            nbStep=numel(obj.confFD.grad.steps);
            stepsXtmp=[obj.confFD.grad.steps(ones(1,obj.dim),:).';zeros(nbStep*(obj.dim-1),obj.dim)];
            stepsXraw = arrayfun(@(i) circshift(stepsXtmp(:, i), nbStep*(i-1)), 1:obj.dim, 'UniformOutput', false);
            stepsXraw = cell2mat(stepsXraw);
            %build array of points for evaluating the function
            sDiff=obj.stepsDiff;
            XX=zeros(obj.nS*nbStep*obj.dim,obj.dim);
            for itS=1:obj.nS
                nbT=nbStep*obj.dim;
                itX=nbT*(itS-1)+(1:nbT);
                try
                    XX(itX,:)=repmat(obj.Xref(itS,:),[nbT 1])+bsxfun(@times,stepsXraw,sDiff(itS,:));
                catch
                    keyboard
                end
            end
            %remove duplicate and store positions
            [XX,~,obj.dupX]=unique(XX,'rows');
            obj.nX=size(XX,1);
        end
        %% load external Z (external evaluation of the function)
        function loadZextG(obj,ZZ)
            if ~isempty(ZZ)
                if numel(ZZ)==obj.nX
                    obj.ZevalG=ZZ(:);
                else
                    fprintf('Wrong size of external responses (expected: %i, provided: %i\n',obj.nX,numel(ZZ));
                end
            end
        end
        %% compute responses of the function at the Xeval points
        function ZZ=GcomputeZ(obj,XX)            
            if ~isempty(obj.fun)
                if nargin>1
                    ZZ=feval(obj.fun,XX);
                else
                    ZZ=feval(obj.fun,obj.XevalG);
                end
            else
                fprintf(['Undefined function for evaluation (' mfilename ')\n']);
            end
        end
        %% compute gradients from responses at the Xeval points
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
            coefTmp=[coefG(ones(1,obj.dim),:).';zeros(nbCoef*(obj.dim-1),obj.dim)];
            coefRaw = arrayfun(@(i) circshift(coefTmp(:, i), nbCoef*(i-1)), 1:obj.dim, 'UniformOutput', false);
            coefRaw = cell2mat(coefRaw);
            %product coef*response
            prodZCoef=rZeval.*repmat(coefRaw,[obj.nS,1]);
            %stepsizes
            sDiff=obj.stepsDiff;
            %build the array of gradients
            GZ=zeros(obj.nS,obj.dim);
            for itS=1:obj.nS
                nbT=nbCoef*obj.dim;
                itX=nbT*(itS-1)+(1:nbT);
                GZ(itS,:)=sum(prodZCoef(itX,:),1)./(divG*sDiff(itS,:));
            end
        end
        %% run demo mode
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

%% available finite differences approachs
function R=loadFD(typeIn)
%from http://web.media.mit.edu/~crtaylor/calculator.html
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
listFD.FD3.grad.steps=[0 1 2 3];
listFD.FD3.grad.coef=[-11 18 -9 2];
listFD.FD3.grad.div=6;
listFD.FD3.hess.steps=[0 1 2 3 4];
listFD.FD3.hess.coef=[35 -104 114 -56 11];
listFD.FD3.hess.div=12;
%
listFD.BD3.grad.steps=[-3 -2 -1 0];
listFD.BD3.grad.coef=[-2 9 -18 11];
listFD.BD3.grad.div=6;
listFD.BD3.hess.steps=[-4 -3 -2 -1 0];
listFD.BD3.hess.coef=[-35 104 -114 56 -11];
listFD.BD3.hess.div=12;
%
listFD.FD4m.grad.steps=[-1 0 1 2 3];
listFD.FD4m.grad.coef=[-3 -10 18 -6 1];
listFD.FD4m.grad.div=12;
listFD.FD4m.hess.steps=[-1 0 1 2 3];
listFD.FD4m.hess.coef=[11 -20 6 4 -1];
listFD.FD4m.hess.div=12;
%
listFD.FD4.grad.steps=[0 1 2 3 4];
listFD.FD4.grad.coef=[-25 48 -36 16 -3];
listFD.FD4.grad.div=12;
listFD.FD4.hess.steps=[0 1 2 3 4 5];
listFD.FD4.hess.coef=[NaN];
listFD.FD4.hess.div=NaN;
%
listFD.BD4p.grad.steps=[-3 -2 -1 0 1];
listFD.BD4p.grad.coef=[-1 6 -18 10 3];
listFD.BD4p.grad.div=12;
listFD.BD4p.hess.steps=[-3 -2 -1 0 1];
listFD.BD4p.hess.coef=[-1 4 6 -20 11];
listFD.BD4p.hess.div=12;
%
listFD.BD4.grad.steps=[-4 -3 -2 -1 0];
listFD.BD4.grad.coef=[3 -16 36 -48 25];
listFD.BD4.grad.div=12;
listFD.BD4.hess.steps=[-5 -4 -3 -2 -1 0 1];
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
listFD.FD5.grad.steps=[0 1 2 3 4 5];
listFD.FD5.grad.coef=[-137 300 -300 200 -75 12];
listFD.FD5.grad.div=60;
listFD.FD5.hess.steps=[0 1 2 3 4 5 6];
listFD.FD5.hess.coef=[NaN];
listFD.FD5.hess.div=NaN;
%
listFD.BD5.grad.steps=[-5 -4 -3 -2 -1 0];
listFD.BD5.grad.coef=[-12 75 -200 300 -300 137];
listFD.BD5.grad.div=60;
listFD.BD5.hess.steps=[-5 -4 -3 -2 -1 0 1];
listFD.BD5.hess.coef=[NaN];
listFD.BD5.hess.div=NaN;
%
listFD.CD6.grad.steps=[-3 -2 -1 1 2 3];
listFD.CD6.grad.coef=[-1 9 -45 45 -9 1];
listFD.CD6.grad.div=60;
listFD.CD6.hess.steps=[-3 -2 -1 0 1 2 3];
listFD.CD6.hess.coef=[2 -27 270 -490 270 -27 2];%fix
listFD.CD6.hess.div=180;
%
listFD.CD8.grad.steps=[-4 -3 -2 -1 1 2 3 4];
listFD.CD8.grad.coef=[3 -32 168 -672 672 -168 32 -3];
listFD.CD8.grad.div=840;
listFD.CD8.hess.steps=[-2 -1 0 1 2]; %fix
listFD.CD8.hess.coef=[-1 16 -30 16 -1];%fix
listFD.CD8.hess.div=12;%fix
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
