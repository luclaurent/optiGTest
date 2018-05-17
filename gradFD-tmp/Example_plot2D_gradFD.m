%% Advanced example of the use of the class gradFD
% L. LAURENT --  13/04/2018 -- luc.laurent@lecnam.net

% sources could be found here:
% https://bitbucket.com/luclaurent/gradFD
% https://github.com/luclaurent/gradFD
%

% gradFD - A toolbox to compute derivatives and hessians using finite differences
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% variables created for this example

%specific function (peaks's Matlab function)
funA=@(x)peaks(x(:,1),x(:,2));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot derivatives
fprintf('Study of the derivatives\n');

%sample points
nbS=50;
x=linspace(-3,3,nbS);
[X,Y]=meshgrid(x);
Xtot=[X(:) Y(:)];
Z=funA(Xtot);

%stepsize
step=1e-4;

%compute gradients with finite differences
gradBCD2=gradFD('CD2',Xtot,step,funA);
GZ=gradBCD2.GZeval;

%reorder data
Zsurf=reshape(Z,nbS,nbS);
GZ1=reshape(GZ(:,1),nbS,nbS);
GZ2=reshape(GZ(:,2),nbS,nbS);

%plots
h=figure;
subplot(221)
surf(X,Y,Zsurf)
title('Peaks function')
xlabel('x','Interpreter','latex')
ylabel('y','Interpreter','latex')
zlabel('f','Interpreter','latex');
subplot(222)
contour(X,Y,Zsurf,20)
hold on
quiver(X,Y,GZ1,GZ2)
hold off
title('Peaks function with quiver plot')
xlabel('x','Interpreter','latex')
ylabel('y','Interpreter','latex')
%
subplot(223)
surf(X,Y,GZ1)
xlabel('x','Interpreter','latex')
ylabel('y','Interpreter','latex')
zlabel('$\frac{\partial f}{\partial x_1}$','Interpreter','latex')
subplot(224)
surf(X,Y,GZ2)
xlabel('x','Interpreter','latex')
ylabel('y','Interpreter','latex')
zlabel('$\frac{\partial f}{\partial x_1}$','Interpreter','latex')

