%% optiGTest class of test functions/problems w/- or w/o constraint(s)
% L. LAURENT --  15/04/2018 -- luc.laurent@lecnam.net

% sources available here:
% https://bitbucket.org/luclaurent/optigtest/
% https://github.com/luclaurent/optigtest/

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
        nameDir={'Constrained','unConstrained','MultiObj','various'}; % names of the folders containing files of functions and useful functions
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
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %% setters
        function set.namePb(obj,txt)
            %if the function is available we store it
            if availablePb(txt)
                obj.namePb=txt;
                % load objective function and constraints functions
                obj.loadPb;
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
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %% add functions in matlab's path
        addTree(obj);
        %% load data about global minimum
        [X,Z]=loadGlobMin(obj);
        %% load data about the design space
        [X,Z]=loadSpace(obj);
        %% load objective and constraints functions and type of constraints
        loadPb(obj);
        %% display details about the defined problem
        dispDetails(obj);
        %% load the available dimension for the considered test function
        loadDimAvailable(obj);
        %% get the available dimension for the considered test function
        dimA=getDimAvailable(obj);
        %% prepare the sample point for evaluation
        Xeval=prepX(obj,XX);
        %% evaluate all functions
        [ZZ,GZ,GG,GGG]=evalAll(obj,XX);
        %% evaluate the objective function
        [ZZ,GZ,GZreshape]=evalObj(obj,XX,num);
        %% evaluate the constraint functions
        [ZZ,GZ,GZreshape]=evalCons(obj,XX,num);
        %% check constraints status
        status=checkCons(obj,XX,num,ZZ);
        %% run demo mode (only for 1D or 2D function)
        hh=demo(obj);
        %% check problem by checking minimum and gradients
        isOk=checkPb(obj,pbName,statusPause);
        %% check any function
        isOk=checkFunObj(obj);
        %% check gradients of any function
        isOk=checkGradFun(obj,funCheck,funName);
        %% check all functions
        isOk=checkAllPb(obj,varargin);
        %% build table of all problems in Markdown
        isOk=funMD(obj,nbCol);
        %% show 2D function
        h=show2D(obj,XX,YY,ZZ,GZ,txt,funName);
        %% show 1D function
        h=show1D(obj,XX,ZZ,GZ,txt,funName);
        %% close all openned figures
        closeFig(obj);
    end
end