classdef unConstrained < handle
    
    properties
        funName='';
        xMin=[];
        xMax=[];
        dim=0;
        locMinZ
        locMinX
        globMinZ
        globMinX
        Xeval
    end
    
    methods
        function obj=unConstrained(funName,XX,dim)
            addpath('unConstrained/');
            obj.funName=funName;
            obj.dim=loadDim(funName);
            if nargin==1
                obj.demo
            elseif nargin==2
                obj.prepX(XX);
                obj.eval()
            elseif nargin==3
                obj.dim=dim;
                obj.prepX(XX);
                obj.eval()
            end
        end
        %setters
        % function set.funName(obj,txt)
        
        %end
        function prepX(obj,XX)
            sX=[size(XX,1) size(XX,2) size(XX,3)];
            nbvar=sX(3);
            if isinf(obj.dim)
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
                        fprintf('Wrong size of sample points\n');
                    end
                else
                    fprintf('Wrong size of sample points\n');
                end
            end
        end
        function [ZZ,GZ]=eval(obj,XX)
            if nargin==1
                [ZZ,GZ]=feval(['fun' obj.funName],obj.Xeval);
            else
                [ZZ,GZ]=feval(['fun' obj.funName],XX);
            end
        end
        function demo(obj)
            if isinf(obj.dim);obj.dim=2;end
            if obj.dim==1
            elseif obj.dim==2||isinf(obj.dim)
                stepM=50;
                [Xmin,Xmax]=loadSpace(obj.funName,obj.dim);
                xL=linspace(Xmin(1),Xmax(1),stepM);
                yL=linspace(Xmin(2),Xmax(2),stepM);
                [x,y]=meshgrid(xL,yL);
                xx=zeros(stepM,stepM,2);
                xx(:,:,1)=x;xx(:,:,2)=y;
                %evaluation of the function
                [ZZ,GZ]=obj.eval(xx);
                %display
                obj.show2D(x,y,ZZ,GZ);
            else
                fprintf('Too large dimension to be plotted');
            end
        end
        function show2D(obj,XX,YY,ZZ,GZ)
            figure
            subplot(1,3,1)
            surf(XX,YY,ZZ);
            axis('tight','square')
            xlabel('x'), ylabel('y'), title(obj.funName)
            subplot(1,3,2)
            surf(XX,YY,GZ(:,:,1));
            axis('tight','square')
            xlabel('x'), ylabel('y'), title(['Grad. X ' obj.funName])
            subplot(1,3,3)
            surf(XX,YY,GZ(:,:,2));
            axis('tight','square')
            xlabel('x'), ylabel('y'), title(['Grad. Y ' obj.funName])
        end
    end
    
end


%load dimension
function dim=loadDim(funName)
listDim=struct(...
    'Brown',Inf);

dim=listDim.(funName);
end

%load space definition
function [xMin,xMax]=loadSpace(funName,dim)
listSpace=struct(...
    'Brown',[-1;4]);

spaceL=listSpace.(funName);
if size(spaceL,2)==1
    xMin=ones(1,dim)*spaceL(1);
    xMax=ones(1,dim)*spaceL(2);
else
    xMin=spaceL(1,:);
    xMax=spaceL(2,:);
end
end


