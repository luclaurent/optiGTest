%% Method of optiGTest class
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

%% check gradients of any function
% INPUTS:
%  - funCheck: handle of checked function (@())
%  - funName: name of the function [optional]
% OUTPUT:
%  - isOk: status of the checking

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
if exist('gradFD','class')
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
        Ofprintf('Issue with the gradients of the %s function\n',funName);
        isOk=false;
    end
    if any(diffGtest(:)>lim)||any(diffGB(:)>lim)||obj.forceDisplayGrad
        Ofprintf(' >> %s function\n',funName);
        Ofprintf('Exact\n');
        for it=1:obj.nSCheck
            Ofprintf('%+7.3e ',GZactual(it,:));
            fprintf('\n');
        end
        fprintf('\n');
        Ofprintf('Finite Difference (%s, %7.3e)\n',obj.FDtype,obj.FDstep);
        for it=1:obj.nSCheck
            Ofprintf('%+7.3e ',GZapprox(it,:));
            fprintf('\n');
        end
        fprintf('\n');
        Ofprintf('Difference\n');
        for it=1:obj.nSCheck
            Ofprintf('%+7.3e ',diffG(it,:));
            fprintf('\n');
        end
        fprintf('\n');
        Ofprintf('DifferenceB\n');
        for it=1:obj.nSCheck
            Ofprintf('%+7.3e ',diffGB(it,:));
            fprintf('\n');
        end
        fprintf('\n');
        Ofprintf('Checking points\n');
        for it=1:obj.nSCheck
            Ofprintf('%+7.3e ',Xsample(it,:));
            fprintf('\n');
        end
    end
else
    Ofprintf(' Unbale to check the gradients because the class gradFD is not available\n');
end
end