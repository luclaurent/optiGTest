%% Colas's function
%L. LAURENT -- 04/11/2016 -- luc.laurent@lecnam.net
%
%numerous local minima
%1 global minimum : x=(0.651906,1.30194,0.099242,?0.883791,?0.8796, 
%               0.204651,-3.28414,0.851188,-3.46245,2.53245,-0.895246,
%               0.204651,-3.28414,0.851188,-3.46245,2.53245,-0.895246,
%               1.40992,-3.07367,1.96257,-2.97872,?0.807849,-1.68978) >> f(x)=11.7464
%
%design space -1<xi<4

%     GRENAT - GRadient ENhanced Approximation Toolbox
%     A toolbox for generating and exploiting gradient-enhanced surrogate models
%     Copyright (C) 2016  Luc LAURENT <luc.laurent@lecnam.net>
%
%     This program is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
%
%     This program is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
%
%     You should have received a copy of the GNU General Public License
%     along with this program.  If not, see <http://www.gnu.org/licenses/>.

function [p,dp]=funCola(xx)

%constant
dd=[1.27 0    0    0    0    0    0    0    0
    1.69 1.43 0    0    0    0    0    0    0
    2.04 2.35 2.45 0    0    0    0    0    0
    3.09 3.18 3.26 2.85 0    0    0    0    0
    3.20 3.22 3.27 2.88 1.55 0    0    0    0
    2.86 2.56 2.58 2.59 3.12 3.06 0    0    0
    3.17 3.18 3.18 3.12 1.31 1.64 3.00 0    0
    3.21 3.18 3.18 3.17 1.70 1.36 2.95 1.32 0
    2.38 2.31 2.42 1.94 2.85 2.81 2.56 2.91 2.97];
%handle function
funR=@(x,y,z)sqrt((x-y).^2+(y-z).^2);

%evaluation and derivatives
nS=[size(xx,1) size(xx,2) size(xx,3)];

xC=zeros(nS);
yC=zeros(nS);
%
xC(:,:,2:end)=xx(:,:,1:2:end);
xC(:,:,2:end)=xx(:,:,1:2:end);



pSum=sum(xx.^2,3);
p=pSum.^2;
if nargout==2
    dp=4*xx.*repmat(pSum,[1 1 size(xx,3)]);
end
end
