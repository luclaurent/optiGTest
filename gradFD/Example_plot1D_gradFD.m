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

%1D function
funB=@(x) exp(-x/10).*cos(x)+1/10*x;
funDB=@(x) -exp(-x/10).*(sin(x)+1/10.*cos(x))+1/10;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot derivatives
fprintf('Study of the derivatives\n');

%sample points
x=(-1:0.1:15)';
%stepsize
step=1;

%evaluate function and actual derivative
Z=funB(x);
GZ=funDB(x);

%compute gradients with finite differences
gradBFD1=gradFD('FD1',x,step,funB);
gradBBD1=gradFD('BD1',x,step,funB);
gradBCD2=gradFD('CD2',x,step,funB);
gradBFD2=gradFD('FD2',x,step,funB);
gradBBD2=gradFD('BD2',x,step,funB);

%plots
figure
plot(x,Z,'b')
hold on
plot(x,GZ,'k')
plot(x,gradBFD1.GZeval,'r')
plot(x,gradBBD1.GZeval,'c')
plot(x,gradBCD2.GZeval,'m')
plot(x,gradBFD2.GZeval,'r-.')
plot(x,gradBBD2.GZeval,'c-.')
legend('Actual function','Actual derivative','FD1','BD1','CD2','FD2','BD2')
title(['Derivatives with stepsize=' num2str(step)])
xlabel('x','Interpreter','latex')
ylabel('$f(x)$, $\frac{\partial f(x)}{\partial x}$','Interpreter','latex');