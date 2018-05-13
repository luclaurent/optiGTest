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
        nbObj=1;                % number of objective function(s)
        nbCons=0;               % number of constrait function(s)
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
        
        nSCheck=5;              % number of sample points used for checking the function
        forceDisplayGrad=false; % flag to force display of gradients
        paranoidCheck=false;    % strict check of function
        FDtype='CD8';           % finite difference scheme
        FDstep=1e-7;            % finite difference stepsize
    end
    properties (Access=private)
        nameDir={'Constrained','unConstrained','MultiObj'}; % names of the folders containing files of functions
        figureHandle=[];            % handles for figures
    end
    
    methods
        %% Constructor of optiGTest class
        % INPUTS (all are optional):
        % - funName: name of the function (list available using method
        % dispAvailableFun)
        % - XX: sample points
        % - dim: dimension of the considered problem
        function obj=optiGTest(PbName,XX,dim)
            fprintf('###############################\n');
            fprintf('### Create optiGTest object ###\n');
            fprintf('###############################\n');
            %add tree of the class in the path
            obj.addTree;
            % no input arguments: create the empty class
            if nargin==0
                fprintf('### Run check process of all problems\n');
                obj.checkAllPb(false);
            else
                if ~isempty(PbName)
                    %load problem
                    obj.namePb=PbName;
                    %display details about the considered problem
                    obj.dispDetails;
                end
            end
            % with input arguments: (1) demo mode (if 1D or 2D function),
            % (2) run with XX, (3) run with XX in specified dimension
            if nargin==1
                %check the requested problem
                if ~isempty(PbName)
                    obj.checkPb(obj.namePb);
                end
            elseif nargin==2
                %prepare sample points
                obj.prepX(XX);
                %evaluate responses and constraints
                obj.evalAll()
            elseif nargin==3
                %apply requested dimension
                obj.dim=dim;
                %prepare sample points
                obj.prepX(XX);
                %evaluate responses and constraints
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
        function T=get.typePb(obj)
            T='Un';
            %unconstrained
            if obj.nbCons>0;T='Cons';end
            %multiobjective
            if obj.nbObj>1;T='Multi';end
        end
        % flag of multi-objective problem
        function nbF=get.nbObj(obj)
            %
            nbF=1;
            %
            if iscellstr(obj.funObj)
                nbF=numel(obj.funObj);
            end
        end
        % flag of constrained problem
        function nbC=get.nbCons(obj)
            %
            nbC=0;
            %
            if iscellstr(obj.funCons)
                nbC=numel(obj.funCons);
            else
                if ~isempty(obj.funCons)
                    nbC=1;
                end
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
                %load default dimension
                obj.dim=obj.getDimAvailable;
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
        %% add figure handles
        function set.figureHandle(obj,hh)
            if all(ishandle(hh))
                obj.figureHandle=[obj.figureHandle hh(:)'];
            else
                obj.figureHandle(hh)=[];
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
        function dispAvailablePb(~)
            dispAvailablePb();
        end
        %% load data about global minimum
        function [X,Z]=loadGlobMin(obj)
            %
            [X,Z]=feval(['loadGlobMin' obj.typePb],obj.namePb,obj.dim);
        end
        %% load data about the design space
        function [X,Z]=loadSpace(obj)
            %
            [X,Z]=feval(['loadSpace' obj.typePb],obj.namePb,obj.dim);
        end
        %% load objective and constraints functions and type of constraints
        function loadPb(obj)
            %
            [funOk,typeTxt]=availablePb(obj.namePb);
            %
            if funOk
                switch typeTxt
                    case {'Cons','Multi'}
                        [obj.funObj,obj.funCons,obj.typeCons]=feval(['loadProb' typeTxt],obj.namePb);
                    otherwise
                        obj.funObj={obj.namePb};
                        obj.funCons={};
                        obj.typeCons={};
                end
            end
            %
        end
        %% display details about the defined problem
        function dispDetails(obj)
            if ~isempty(obj.namePb)
                fprintf('\n## Problem: %s\n',obj.namePb);
                fprintf('# Objective function(s):');
                %
                funDisp=@(x)fprintf(' %s,',x);
                %
                if obj.nbObj>1
                    cellfun(funDisp,obj.funObj);
                else
                    fprintf(' %s',obj.funObj{1});
                end
                fprintf('\n');
                %
                fprintf('# Constraint function(s):');
                if obj.nbCons==0
                    fprintf(' None\n');
                elseif obj.nbCons==1
                    fprintf(' %s',obj.funCons);
                else
                    cellfun(funDisp,obj.funCons);
                end
                %
                fprintf('# Considered dimension: %i\n',obj.dim);
                fprintf('# Considered design space:\n');
                fprintf('#  Min: ');fprintf('%-+d ',obj.xMin);fprintf('\n');
                fprintf('#  Max: ');fprintf('%-+d ',obj.xMax);fprintf('\n');
                fprintf('# Considered global minimum(s) (sample points and response value(s)):\n');
                %
                Xmin=obj.globMinX;
                Zmin=obj.globMinZ;
                for itM=1:numel(Zmin)
                    fprintf('#  %-+d\t%-+d || %d \n',Xmin(itM,:),Zmin(itM));
                end
                fprintf('\n');
            end
        end
        %% load the available dimension for the considered test function
        function loadDimAvailable(obj)
            %
            obj.dimAvailable=feval(['loadDim' obj.typePb],obj.namePb);
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
        function [ZZ,GZ,GZreshape]=evalObj(obj,XX,num)
            %default values
            Xrun=obj.Xeval;
            numOk=[];
            if nargin>2, if ~isempty(num);numOk=num;end, end
            %
            if nargin>1
                if ~isempty(XX)
                    Xrun=obj.prepX(XX);
                end
            end
            %
            %specific objective function(s)
            if ~isempty(numOk)
                cellObj=obj.funObj(numOk);
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
            if nbF==1
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
                if nbF==1
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
        function [ZZ,GZ,GZreshape]=evalCons(obj,XX,num)
            %default values
            Xrun=obj.Xeval;
            numOk=[];
            if nargin>2, if ~isempty(num);numOk=num;end, end
            %
            if nargin>1
                if ~isempty(XX)
                    Xrun=obj.prepX(XX);
                end
            end
            %
            if obj.nbCons>0
                %specific constraint function
                if ~isempty(numOk)
                    cellCons=obj.funCons(numOk);
                else
                    cellCons=obj.funCons;
                end
                %
                nbF=numel(cellCons);
                %evaluate (all) objective function(s)
                funE=@(x,y)feval(['fun' x],y);
                %%
                if nargout>1
                    [ZZtmp,GZtmp]=cellfun(@(x)funE(x,Xrun),cellCons,'UniformOutput',false);
                else
                    [ZZtmp]=cellfun(@(x)funE(x,Xrun),cellCons,'UniformOutput',false);
                end
                %reshape data
                if nbF==1
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
                    if nbF==1
                        GZreshape=reshape(GZ,[],size(GZ,3));
                    else
                        funR=@(x)reshape(x,[],size(x,3));
                        GZreshape=cellfun(funR,GZ,'UniformOutput',false);
                    end
                end
            else
                fprintf('No constraint function(s)\n');
                ZZ=NaN;
                GZ=NaN;
                GZreshape=NaN;
            end
        end
        %% check constraints status
        function status=checkCons(obj,XX,num,ZZ)
            %default values
            numOk=[];
            status=true;
            if obj.nbCons>0
                availResp=false;availPts=false;
                %deal with input arguments
                if nargin==4, if ~isempty(ZZ);availResp=true;ZZOk=ZZ;end, end
                if nargin>1, if ~isempty(XX);availPts=true;end, end
                if nargin>2, if ~isempty(num);numOk=num;end, end
                %available sample points
                if availPts
                    obj.prepX(XX);
                    availResp=false; % priority on new sample points
                end
                % with no values of constraints
                if ~availResp
                    %evaluation contraint(s)
                    ZZOk=obj.evalCons([],numOk);
                end
                
                %% check constraints
                %specific constraint test
                if ~isempty(numOk)
                    cellType=obj.typeCons(numOk);
                else
                    cellType=obj.typeCons;
                end
                %obtain right function name
                testFun=cellfun(@(x)boolFun(x),cellType,'UniformOutput',false);
                %many constraints
                funCheck=@(x,y)y(x,0);
                if iscell(ZZOk)
                    status=cellfun(funCheck,ZZOk,testFun);
                else
                    status=feval(funCheck,ZZOk,testFun);
                end
                
            else
                fprintf('No constraint function(s)\n');
            end
        end
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
        %% check function by checking minimum and gradients
        function isOk=checkPb(obj,pbName,statusPause)
            if nargin==0; pbName=obj.namePb;end
            if nargin<3; statusPause=false;end
            %check minimum
            obj.namePb=pbName;            
            %check minimum on objective function
            isOk=obj.checkFunObj;
            %check gradients 
            % of objective function(s)
            for itF=1:obj.nbObj
               funCheck=@(X)obj.evalObj(X,itF);
               isOkCurrent=obj.checkGradFun(funCheck,obj.funObj{itF});
               isOk=isOk&&isOkCurrent;
            end
            % of constraint function(s)
            if obj.nbCons>0
                for itF=1:obj.nbCons
                   funCheck=@(X)obj.evalCons(X,itF);
                   isOkCurrent=obj.checkGradFun(funCheck,obj.funCons{itF});
                   isOk=isOk&&isOkCurrent;
                end
            end
            if ~isOk&&statusPause
                pause
            end
        end
        %% check any function
        function isOk=checkFunObj(obj)
            isOk=true;
            %load dimension
            dimCheck=obj.getDimAvailable;
            %
            if isinf(dimCheck);dimCheck=5;end
            if numel(dimCheck)~=1;[~,II]=min(abs(dimCheck-5));dimCheck=dimCheck(II);end
            obj.dim=dimCheck;
            %details of minimum
            X=obj.globMinX;
            Z=obj.globMinZ;
            %threshold 
            limO=1e-4;
            % works only for non multiobjective problems
            if ~any(isnan(Z))
                if size(X,2)>obj.dim
                    X=X(:,1:obj.dim);
                end
                %compute objective value
                ZZ=obj.evalObj(X);              
                %
                if all(abs(ZZ(:)-Z(:))>limO)
                    fprintf('Issue with the %s function (wrong minimum obtained)\n',obj.namePb);
                    fprintf('Obtained: ');fprintf('%d ',ZZ(:)');
                    fprintf('\n');
                    fprintf('Expected: ');fprintf('%d ',Z(:)');
                    fprintf('\n');
                    isOk=false;
                end
            end
        end
        %% check gradients of any function
        function isOk=checkGradFun(obj,funCheck,funName)
            %default
            isOk=true;
            if nargin<3;funName='';end
            %threshold
            lim=1e-5;
            %space
            XminSpace=obj.xMin;
            XmaxSpace=obj.xMax;
            %build sampling points
            if exist('lhsdesign','file')
                Xsample=lhsdesign(obj.nSCheck,obj.dim);
            else
                Xsample=rand(obj.nSCheck,obj.dim);
            end
            %rescale the samples
            Xsample=Xsample.*repmat(XmaxSpace-XminSpace,obj.nSCheck,1)+repmat(XminSpace,obj.nSCheck,1);
            %evaluate function at the sample
            [~,~,GZactual]=funCheck(Xsample);
            %compute approximate gradients using finite differences
            FDclass=gradFD(obj.FDtype,Xsample,obj.FDstep,funCheck);            
            GZapprox=FDclass.GZeval;
            %compare results
            diffG=abs((GZactual-GZapprox)./GZactual);
            diffGB=abs((GZactual-GZapprox)./(1+abs(GZactual)));
            %remove bad terms
            diffGtest=diffG(~isinf(diffG));
            %
            critCheckA=(any(diffGtest(:)>lim)...
                ||any(diffGB(:)>lim))...
                &&obj.paranoidCheck;
            critCheckB=(sum(diffGtest(:)>lim)>floor(numel(diffGtest(:))/3)...
                ||sum(diffGB(:)>lim)>floor(numel(diffGB(:))/3))...
                &&~obj.paranoidCheck;
            if critCheckA||critCheckB
                fprintf('Issue with the gradients of the %s function\n',funName);
                isOk=false;
            end
            if any(diffGtest(:)>lim)||any(diffGB(:)>lim)||obj.forceDisplayGrad
                fprintf(' >> %s function\n',funName);
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
                fprintf('DifferenceB\n');
                for it=1:obj.nSCheck
                    fprintf('%+7.3e ',diffGB(it,:));
                    fprintf('\n');
                end
                fprintf('\n');
                fprintf('Checking points\n');
                for it=1:obj.nSCheck
                    fprintf('%+7.3e ',Xsample(it,:));
                    fprintf('\n');
                end
            end
        end
        
        %% check all functions
        function isOk=checkAllPb(obj,varargin)
            %default values
            isOk=true;
            flag=false;
            typeCheckPb='';
            %deal with input arguments            
            for itV=1:numel(varargin)
                if  islogical(varargin{itV})
                    flag=varargin{itV};
                elseif ischar(varargin{itV})
                    typeCheckPb=varargin{itV};
                end
            end

            %extract list of problems
            listFun=listPb(typeCheckPb);
            if flag %check all by continuing at the current position
                currPos=find(ismember(listFun,obj.consPb));
                currPos=currPos(1);
                listFun=listFun(currPos:end);
            end
            %check every function
            for itF=1:numel(listFun)
                fprintf(' >>> Problem %s\n',listFun{itF});
                tmpStatus=obj.checkPb(listFun{itF},true);
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
        %% close all openned figures
        function closeFig(obj)
            if ~isempty(obj.figureHandle)
                %use temporary list of figures
                tmpFigHandle=obj.figureHandle;
                for itF=1:numel(tmpFigHandle)
                    %close figure
                    %try
                    close(tmpFigHandle(itF));
                    %catch
                    %    keyboard
                    %end
                    %remove it from the list
                    obj.figureHandle=1;
                end
            end
        end
    end
    
end


%% function for checking if the function is available
function [funOk,typePb]=availablePb(txt)
funOk=false;
%extract name of functions
strPbUn=loadDimUn();
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
if any(ismember(listPbCons,txt))
    funOk=true;
    typePb='Cons';
end
if any(ismember(listPbMulti,txt))
    funOk=true;
    typePb='Multi';
end
end

%% extract list of problems
function l=listPb(typePb)

if nargin==0;typePb='';end

switch typePb
    case {'UnConstrained','Un','un','Unconstrained','unconstrained'}
        strPb=loadDimUn();
        l=fieldnames(strPb);
    case {'Constrained','Cons','cons','constrained'}
        strPb=loadProbCons();
        %
        l=fieldnames(strPb);
    case {'MultiObj','Multi','multi','Multiobj','multiobj'}
        strPb=loadProbMulti();
        %
        l=fieldnames(strPb);
    otherwise
        strPbUn=loadDimUn();
        strPbCons=loadProbCons();
        strPbMulti=loadProbMulti();
        %
        listPbUn=fieldnames(strPbUn);
        listPbCons=fieldnames(strPbCons);
        listPbMulti=fieldnames(strPbMulti);
        %        
        l=vertcat(listPbUn,listPbCons,listPbMulti);
end
end

%% display available testfunctions
function funOk=dispAvailablePb()
%extract name of porblems
strPbUn=loadDimUn();
strPbCons=loadProbCons();
strPbMulti=loadProbMulti();
%
listPbUn=fieldnames(strPbUn);
listPbCons=fieldnames(strPbCons);
listPbMulti=fieldnames(strPbMulti);
%count information
funCount=@(x,y,n)numel(x(n).(y));
nbConsPb=cellfun(@(x)funCount(strPbCons,x,3),listPbCons);
nbMultiConsPb=cellfun(@(x)funCount(strPbMulti,x,3),listPbMulti);
nbMultiObjPb=cellfun(@(x)funCount(strPbMulti,x,1),listPbMulti);
%
%Show existing problems
fprintf('=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=\n');
fprintf('Available test problems\n');
fprintf('------------------------\n');
cellfun(@(X)fprintf('Unconstrained: %s\n',X),listPbUn);
fprintf('------------------------\n');
fprintf('------------------------\n');
cellfun(@(X,Y,Z)fprintf('Constrained: %s (nb constraints: %i)\n',X,Y),...
    listPbCons,num2cell(nbConsPb));
fprintf('------------------------\n');
fprintf('------------------------\n');
cellfun(@(X,Y,Z)fprintf('Multiobjective: %s (nb objective/constraints: %i/%i)\n',X,Y,Z),...
    listPbMulti,num2cell(nbMultiObjPb),num2cell(nbMultiConsPb));
fprintf('------------------------\n');
fprintf('=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=\n');
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

%% custom surface plot
function surfCustom(XX,YY,ZZ)
%
hh=surf(XX,YY,ZZ);
%
shading interp
light
lighting phong
%
axis('tight','square')
xlabel('$x$','Interpreter','latex')
ylabel('$y$','Interpreter','latex')
zlabel('$f$','Interpreter','latex')
%title(obj.funName)
%
%% Extract X,Y and Z data from surface plot
X=hh.XData;
Y=hh.YData;
Z=hh.ZData;
%% Divide the lengths by the number of lines needed
xlength = size(ZZ,2);
ylength = size(ZZ,1);
xnumlines = 10; % 10 lines
ynumlines = 10; % 10 partitions
xspacing = round(xlength/xnumlines);
yspacing = round(ylength/ynumlines);
%% Plot the mesh lines
% Plotting lines in the X-Z plane
hold on
for i = 1:yspacing:ylength
    mesh([X(i,:);X(i,:)], [Y(i,:);Y(i,:)], [Z(i,:);Z(i,:)],'EdgeColor',0.7.*[1,1,1]);
end
% Plotting lines in the Y-Z plane
for i = 1:xspacing:xlength
    mesh([X(:,i),X(:,i)], [Y(:,i),Y(:,i)], [Z(:,i),Z(:,i)],'EdgeColor',0.7.*[1,1,1]);
end
hold off
end

%% function for finding relation operator of boolean test
function txtFun=boolFun(txtSymbol)
txtFun='';
if isa(txtSymbol,'function_handle')
    txtFun=txtSymbol;
else
    switch txtSymbol
        case {'==','eq'}
            txtFun=@eq;
        case {'~=','ne'}
            txtFun=@ne;
        case {'<=','=<','le'}
            txtFun=@le;
        case {'>=','=>','ge'}
            txtFun=@ge;
        case {'<','lt'}
            txtFun=@lt;
        case {'>','gt'}
            txtFun=@gt;
    end
end
end
