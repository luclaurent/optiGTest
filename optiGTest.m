%% optiGTest class of test functions/problems w/- or w/o constraint(s)
% L. LAURENT --  15/04/2018 -- luc.laurent@lecnam.net

% https://bitbucket.org/luclaurent/optigtest/

% optiGTest - set of testing functions    A toolbox to easy manipulate functions.
% Copyright (C) 2018  Luc LAURENT <luc.laurent@lecnam.net>
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


classdef optiGTest < handle
    
    properties
        namePb='';              % chosen problem
        typePb='';              % kind of problems ('Un'=unconstrained, 'Cons'= constrained, 'Mult'=multiobjective)
        %
        multiObj=false;         %flag for multiobjective problem
        wCons=false;            %flag for constrained problem
        %
        funObj={};              % objective function
        funCons={};             % list of constraint functions
        typeCons={};            % list of type of constraints (<, >, <=, >=, =)
        xMin=[];                % lower bound(s)
        xMax=[];                % upper bound(s)
        dim=0;                  % dimension of the problem (number of design variables)
        dimAvailable=0;         % available dimension for the chosen problem
        locMinZ                 % list of local minima (responses)
        locMinX                 % list of local minima (associated parameters)
        globMinZ                % list of global minima (responses)
        globMinX                % list of global minima (associated parameters)
        Xeval                   % set of parameters used for evaluating the function
        
        nbCons=0;               % number of constrained functions
        
        nSCheck=5;              % number of sample points used for checking the function
        forceDisplayGrad=false; % flag to force display of gradients
        paranoidCheck=false;    % strict check of function
        FDtype='CD8';
        FDstep=1e-7;
    end
    properties (Access=private)
        nameDir={'Constrained','unConstrained','MultiObj'}; % names of the folders containing files of functions
    end
    
    methods
        %% Constructor of optiGTest class
        % INPUTS (all are optional):
        % - funName: name of the function (list available using method
        % dispAvailableFun)
        % - XX: sample points
        % - dim: dimension of the considered problem
        function obj=optiGTest(PbName,XX,dim)
            %add tree of the class in the path
            obj.addTree;
            % no input arguments: create the empty class
            if nargin==0
                obj.checkAllPb(false);
            else
                obj.namePb=PbName;
                obj.dim=loadDim(PbName);
            end
            % with input arguments: (1) demo mode (if 1D or 2D function),
            % (2) run with XX, (3) run with XX in specified dimension
            if nargin==1
                obj.checkFun(obj.namePb);
            elseif nargin==2
                obj.prepX(XX);
                obj.evalAll()
            elseif nargin==3
                obj.dim=dim;
                obj.prepX(XX);
                obj.evalAll()
            end
        end
        %% getters
        function Xmax=get.xMax(obj)
            [~,Xmax]=obj.loadSpace;
        end
        function Xmin=get.xMin(obj)
            [Xmin,~]=obj.loadSpace;
        end
        function Z=get.globMinZ(obj)
            [~,Z]=obj.loadGlobMin;
            if size(Z,2)>obj.dim
                Z=Z(:,1:obj.dim);
            end
        end
        function X=get.globMinX(obj)
            [X,~]=obj.loadGlobMin;
        end
        % flag of multi-objective problem
        function status=get.multiObj(obj)
            %
            status=false;
            %
           if iscellstr(obj.funObj)
               if numel(obj.funObj)>1
                   status=true;
               end
           end
        end
        % flag of constrained problem
        function status=get.wCons(obj)
            %
            status=false;
            %
           if iscellstr(obj.funCons)
               if numel(obj.funCons)>0
                   status=true;
               end
           else 
               status=~isempty(obj.funCons);
           end
        end
        %% setters
        function set.namePb(obj,txt)
            %if the function is available we store it
            if availablePb(txt)
                obj.namePb=txt;
                % load objective function and constraints functions
                obj.loadPb;
                % load available dimension
                obj.loadDimAvailable;                
            else
                fprintf('Problem %s unavailable \n',txt);
                dispAvailablePb();
            end
        end
        function set.dim(obj,val)
            if isinf(val)
                dimA=obj.getDimAvailable;
                [~,II]=min(abs(dimA-2));
                obj.dim=dimA(II);
            else
                obj.dim=val;
            end
        end
        %% add functions in matlab's path
        function addTree(obj)
            %extract folder of the current class
            folder=fileparts(mfilename('fullpath'));
            %add specific folder in matlab's path
            if iscell(obj.nameDir)
                fullDir=cellfun(@(x)fullfile(folder,x),obj.nameDir,'UniformOutput',false);
                cellfun(@addpath,fullDir);
            else
                addpath(fullfile(folder,obj.nameDir));
            end
            %addpath gradFD
            addpath(fullfile(folder,'gradFD'));
        end
        %% show available test functions
        function dispAvailablePb(obj)
            dispAvailablePb();
        end
        %% load data about global minimum
        function [X,Z]=loadGlobMin(obj)
            %
            typetxt=obtainKeyword(obj.typePb);
            %
            [X,Z]=feval(['loadGlobMin' typetxt],obj.namePb);
        end
        %% load data about the design space
        function [X,Z]=loadSpace(obj)
            %
            typetxt=obtainKeyword(obj.typePb);
            %
            [X,Z]=feval(['loadSpace' typetxt],obj.namePb);
        end
        %% load objective and constraints functions and type of constraints
        function loadPb(obj)
            %
            typetxt=obtainKeyword(obj.typePb);
            %
            if ~isempty(typetxt)
                [obj.funObj,obj.funCons,obj.typeCons]=feval(['loadProb' typetxt],obj.namePb);
            else
                obj.funObj=obj.namePb;
                obj.funCons={};
                obj.typeCons={};
            end
        end
        %% load the available dimension for the considered test function
        function loadDimAvailable(obj)
            %
            typetxt=obtainKeyword(obj.typePb);
            %
            obj.dimAvailable=feval(['loadDim' typetxt],obj.namePb);
        end
        %% get the available dimension for the considered test function
        function dimA=getDimAvailable(obj)
            dimA=obj.dimAvailable;
        end
        %% prepare the sample point for evaluation
        function Xeval=prepX(obj,XX)
            sX=[size(XX,1) size(XX,2) size(XX,3)];
            nbvar=sX(3);
            if any(isinf(obj.dimAvailable))
                if nbvar==1
                    obj.Xeval=reshape(XX,[],1,sX(2));
                else
                    obj.Xeval=XX;
                    obj.dim=nbvar;
                end
            else
                if nbvar==obj.dim
                    obj.Xeval=XX;
                elseif nbvar==1
                    if sX(2)==obj.dim
                        obj.Xeval=reshape(XX,[],1,sX(2));
                    else
                        fprintf(['Wrong size of sample points (' mfilename ')\n']);
                    end
                else
                    fprintf(['Wrong size of sample points (' mfilename ')\n']);
                end
            end
            Xeval=obj.Xeval;
        end
        %% evaluate all functions
        function [ZZ,GZ,GG,GGG]=evalAll(obj,XX)
            if nargin>1
                obj.prepX(XX);
            end
            % evaluate objective function(s)
            [ZZ,GZ]=obj.evalObj;
            % evaluate constraint function(s)
            if nargout>2
                [GG,GGG]=obj.evalCons;
            end
        end
        %% evaluate the objective function
        function [ZZ,GZ,GZreshape]=evalObj(obj,XX)
            if nargin==1
                Xrun=obj.Xeval;
            else
                Xrun=obj.prepX(XX);
            end
            %
            if ~obj.multiObj
                cellObj={obj.funObj};
            else
                cellObj=obj.funObj;
            end
            %
            nbF=numel(cellObj);
            ZZtmp=cell(1,nbF);
            if nargout>1;GZtmp=cell(1,nbF);end
            %evaluate (all) objective function(s)
            for itF=1:numel(cellObj)
                if nargout>1
                    [ZZtmp{itF},GZtmp{itF}]=feval(['fun' cellObj{itF}],Xrun);
                else
                    [ZZtmp{itF}]=feval(['fun' cellObj{itF}],Xrun);
                end
            end
            %reshape data
            if ~obj.multiObj
                ZZ=ZZtmp{1};
                if nargout>1
                    GZ=GZtmp{1};
                end
            else
                ZZ=ZZtmp;
                if nargout>1
                    GZ=GZtmp;
                end
            end
            if nargout>2
                if ~obj.multiObj
                    GZreshape=reshape(GZ,[],size(GZ,3));
                else
                    GZreshape=cell(1,nbF);
                    for itF=1:numel(cellObj)
                        GZreshape{itF}=reshape(GZ{itF},[],size(GZ{itF},3));
                    end
                end
            end
        end
        %% evaluate the constraint functions
        function [ZZ,GZ,GZreshape]=evalCons(obj,XX)
            if nargin==1
                Xrun=obj.Xeval;
            else
                Xrun=obj.prepX(XX);
            end
            %
            if ~obj.wCons
                cellCons={obj.funCons};
            else
                cellCons=obj.funCons;
            end
            %
            nbF=numel(cellCons);
            ZZtmp=cell(1,nbF);
            if nargout>1;GZtmp=cell(1,nbF);end
            %evaluate (all) objective function(s)
            for itF=1:numel(cellCons)
                if nargout>1
                    [ZZtmp{itF},GZtmp{itF}]=feval(['fun' cellCons{itF}],Xrun);
                else
                    [ZZtmp{itF}]=feval(['fun' cellCons{itF}],Xrun);
                end
            end
            %reshape data
            if ~obj.multiObj
                ZZ=ZZtmp{1};
                if nargout>1
                    GZ=GZtmp{itF};
                end
            else
                ZZ=ZZtmp;
                if nargout>1
                    GZ=GZtmp;
                end
            end
            if nargout>2
                if ~obj.multiObj
                    GZreshape=reshape(GZtmp,[],size(GZtmp,3));
                else
                    GZreshape=cell(1,nbF);
                    for itF=1:numel(cellCons)
                        GZreshape{itF}=reshape(GZtmp{itF},[],size(GZtmp{itF},3));
                    end
                end
            end
        end
        %% check constraints status
        function status=checkCons(obj,num,XX)
            
        end
        %% run demo mode (only for 1D or 2D function)
        function demo(obj)
            if isinf(obj.dimAvailable);obj.dim=2;end
            if obj.dim==1
                stepM=100;
                [Xmin,Xmax]=loadSpace(obj.consPb,1);
                xx=linspace(Xmin(1),Xmax(1),stepM);
                %evaluation of the function
                [ZZ,GZ]=obj.evalObj(xx);
                %display
                obj.show1D(xx,ZZ,GZ);
            elseif any(ismember(obj.dimAvailable,2))||isinf(obj.dimAvailable)
                obj.dim=2;
                stepM=51;
                [Xmin,Xmax]=loadSpace(obj.consPb,2);
                xL=linspace(Xmin(1),Xmax(1),stepM);
                yL=linspace(Xmin(2),Xmax(2),stepM);
                [x,y]=meshgrid(xL,yL);
                xx=zeros(stepM,stepM,2);
                xx(:,:,1)=x;xx(:,:,2)=y;
                %evaluation of the function
                [ZZ,GZ]=obj.evalObj(xx);
                %display
                obj.show2D(x,y,ZZ,GZ);
            else
                fprintf(['Too large dimension to be plotted (' mfilename ')\n']);
            end
        end
        %% check function by checking minimum
        function isOk=checkFun(obj,funName,statusPause)
            if nargin==0; funName=obj.funName;end
            if nargin<2; statusPause=false;end
            lim=1e-5;
            limO=1e-4;
            %check minimum
            obj.funName=funName;
            %load dimension
            dimCheck=loadDim(funName);
            if isinf(dimCheck);dimCheck=5;end
            if numel(dimCheck)~=1;[~,II]=min(abs(dimCheck-5));dimCheck=dimCheck(II);end
            obj.dim=dimCheck;
            %
            isOk=true;
            X=obj.globMinX;
            if size(X,2)>obj.dim
                X=X(:,1:obj.dim);
            end
            ZZ=obj.eval(X);
            Z=obj.globMinZ;
            if all(abs(ZZ(:)-Z(:))>limO)
                fprintf('Issue with the %s function (wrong minimum obtained)\n',funName);
                fprintf('Obtained: ');fprintf('%d ',ZZ(:)');
                fprintf('\n');
                fprintf('Expected: ');fprintf('%d ',Z(:)');
                fprintf('\n');
                isOk=false;
            end
            %check derivatives
            [XminSpace,XmaxSpace]=loadSpace(funName,dimCheck);
            %build sampling points
            if exist('lhsdesign','file')
                Xsample=lhsdesign(obj.nSCheck,dimCheck);
            else
                Xsample=rand(obj.nSCheck,dimCheck);
            end
            %rescale the samples
            Xsample=Xsample.*repmat(XmaxSpace-XminSpace,obj.nSCheck,1)+repmat(XminSpace,obj.nSCheck,1);
            %evaluate function at the sample
            obj.prepX(Xsample);
            [~,~,GZactual]=obj.eval();
            %compute approximate gradients using finite differences
            obj.funName=funName;
            FDfun=@(X)obj.eval(X);
            FDclass=gradFD(obj.FDtype,Xsample,obj.FDstep,FDfun);
            GZapprox=FDclass.GZeval;
            %compare results
            diffG=abs((GZactual-GZapprox)./GZactual);
            if any(diffG(:)>lim)&&obj.paranoidCheck||sum(diffG(:)>lim)>floor(numel(diffG(:))/3)&&~obj.paranoidCheck
                fprintf('Issue with the gradients of the %s function\n',funName);
                isOk=false;
            end
            if any(diffG(:)>lim)||obj.forceDisplayGrad
                
                fprintf('Exact\n');
                for it=1:obj.nSCheck
                    fprintf('%+7.3e ',GZactual(it,:));
                    fprintf('\n');
                end
                fprintf('\n');
                fprintf('Finite Difference (%s, %7.3e)\n',obj.FDtype,obj.FDstep);
                for it=1:obj.nSCheck
                    fprintf('%+7.3e ',GZapprox(it,:));
                    fprintf('\n');
                end
                fprintf('\n');
                fprintf('Difference\n');
                for it=1:obj.nSCheck
                    fprintf('%+7.3e ',diffG(it,:));
                    fprintf('\n');
                end
                fprintf('\n');
                fprintf('Checking points\n');
                for it=1:obj.nSCheck
                    fprintf('%+7.3e ',Xsample(it,:));
                    fprintf('\n');
                end
            end
            if ~isOk&&statusPause
                pause
            end
        end
        %% check all functions
        function isOk=checkAllPb(obj,flag)
            isOk=true;
            %extract name of functions
            strFun=loadDim();
            listFun=fieldnames(strFun);
            if flag %check all by continuing at the current position
                currPos=find(ismember(listFun,obj.consPb));
                currPos=currPos(1);
                listFun=listFun(currPos:end);
            end
            %check every function
            for itF=1:numel(listFun)
                fprintf(' >>> Function %s\n',listFun{itF});
                tmpStatus=obj.checkFun(listFun{itF},true);
                isOk=isOk&&tmpStatus;
            end
        end
        %% build table of all function in Markdown
        function isOk=funMD(obj,nbCol)
            if nargin==1;nbCol=3;end
            isOk=true;
            %extract name of functions
            strFun=loadDim();
            listFun=fieldnames(strFun);
            listDim=cell(1,numel(listFun));
            for itF=1:numel(listFun)
                listDim{itF}=strFun.(listFun{itF});
            end
            %generate Markdown table
            buildTableMD(listFun,listDim,nbCol);
        end
        %% show 2D function
        function show2D(obj,XX,YY,ZZ,GZ)
            nbR=2;
            nbC=3;
            nbLevel=10;
            
            figure
            subplot(nbR,nbC,1)
            surf(XX,YY,ZZ);
            axis('tight','square')
            xlabel('x'), ylabel('y'), title(obj.funName)
            subplot(nbR,nbC,2)
            surf(XX,YY,GZ(:,:,1));
            axis('tight','square')
            xlabel('x'), ylabel('y'), title(['Grad. X ' obj.funName])
            subplot(nbR,nbC,3)
            surf(XX,YY,GZ(:,:,2));
            axis('tight','square')
            xlabel('x'), ylabel('y'), title(['Grad. Y ' obj.funName])
            %
            subplot(nbR,nbC,4)
            contourf(XX,YY,ZZ,nbLevel);
            axis('tight','square')
            xlabel('x'), ylabel('y'), title(obj.funName)
            subplot(nbR,nbC,5)
            contourf(XX,YY,GZ(:,:,1),nbLevel);
            axis('tight','square')
            xlabel('x'), ylabel('y'), title(['Grad. X ' obj.funName])
            subplot(nbR,nbC,6)
            contourf(XX,YY,GZ(:,:,2),nbLevel);
            axis('tight','square')
            xlabel('x'), ylabel('y'), title(['Grad. Y ' obj.funName])
        end
        %% show 1D function
        function show1D(obj,XX,ZZ,GZ)
            nbR=1;
            nbC=2;
            %
            figure
            subplot(nbR,nbC,1)
            plot(XX,ZZ);
            axis('tight','square')
            xlabel('x'), ylabel('F'), title(obj.funName)
            subplot(nbR,nbC,2)
            plot(XX,GZ(:,:,1));
            axis('tight','square')
            xlabel('x'), ylabel('dF/dx'), title(['Grad. ' obj.funName])
        end
    end
    
end


%% function for checking if the function is available
function [funOk,typePb]=availablePb(txt)
funOk=false;
%extract name of functions
strPbUn=loadDim();
strPbCons=loadDimCons();
strpbMulti=loadDimMulti();
%
listPbUn=fieldnames(strPbUn);
listPbCons=fieldnames(strPbCons);
listPbMulti=fieldnames(strpbMulti);
%
%check if function is available and which case of pb it is
if any(ismember(listPbUn,txt))
    funOk=true;
    typePb='Un';
end
%
if any(ismember(listPbCons,txt))
    funOk=true;
    typePb='Cons';
end
%
if any(ismember(listPbMulti,txt))
    funOk=true;
    typePb='Multi';
end
end

%% display available testfunctions
function funOk=dispAvailablePb()
%extract name of functions
strFun=loadDim();
listFun=fieldnames(strFun);
%check if function is available
fprintf('=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=\n');
fprintf('Available test problems\n');
cellfun(@(X)fprintf('%s\n',X),listFun);
fprintf('=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=\n');
end

%% specific keywords for dedicated functions
function txtKey=obtainKeyword(typePb)
txtKey='';
switch typePb
    case 'Cons'
        txtKey='Cons';
    case 'Multi'
        txtKey='Multi';
end
end

%% function display table with two columns of text
function dispTableTwoColumns(tableA,tableB)
%size of every components in tableA
sizeA=cellfun(@numel,tableA);
maxA=max(sizeA);
%space after each component
spaceA=maxA-sizeA+3;
spaceTxt=' ';
%display table
for itT=1:numel(tableA)
    Gfprintf('%s%s%s\n',tableA{itT},spaceTxt(ones(1,spaceA(itT))),tableB{itT});
end
end

%% build Markdown table of the functions (with dimension)
function buildTableMD(funName,dimL,nbCol)
nbFun=numel(funName);
nbFunPerCol=floor(nbFun/(nbCol));
%
funTable=cell(nbFunPerCol,nbCol);
dimTable=cell(nbFunPerCol,nbCol);
for itF=1:nbFun
    funTable{itF}=funName{itF};
    dimTable{itF}=dimL{itF};
end
funTable=funTable';
dimTable=dimTable';

itF=1;
for itR=1:nbFunPerCol
    if itR==1
        fprintf(repmat('|-',1,nbCol));
        fprintf('|\n');
        fprintf(repmat('|-----',1,nbCol));
        fprintf('|\n');
    end
    for itC=1:nbCol
        if ~isempty(funTable{itF})
            fprintf('| %s',funTable{itF});
        end
        if itC==nbCol
            fprintf('|\n');
        end
        itF=itF+1;
    end
end
end
