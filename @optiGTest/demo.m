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

%% run demo mode (only for 1D or 2D function)
% OUTPUT:
%  - hh: handles of figures stored in cells

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
    stepM=100;
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
    if obj.nbCons>0
        %evaluation of constraint function(s)
        [ZZcons,GZcons]=obj.evalCons(xx);
        statusCons=obj.checkCons;
        %display
        hh(2)=obj.show2D(x,y,ZZcons,GZcons,[obj.namePb ': Constraint'],obj.funCons);
        hh(3)=obj.show2DCons(x,y,ZZobj,statusCons,[obj.namePb ': Objective function with Constraint'],obj.funObj);
    end
    %store figure handle
    obj.figureHandle=hh;
else
    fprintf(['Too large dimension to be plotted (' mfilename ')\n']);
end
end