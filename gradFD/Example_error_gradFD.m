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
%% Plot error due to stepsize
fprintf('Study of the error due to the stepsize\n');

%sample point
x=5;
%stepsize
step=logspace(0,-13,1000);

%evaluate actual derivative
GZ=funDB(x);

%compute gradients with finite differences
errFD1=zeros(size(step));
errBD1=zeros(size(step));
errCD2=zeros(size(step));
errFD2=zeros(size(step));
errBD2=zeros(size(step));
errCD4=zeros(size(step));
errFD3=zeros(size(step));
errBD3=zeros(size(step));
errCD6=zeros(size(step));
for itS=1:numel(step)
    gradBFD1=gradFD('FD1',x,step(itS),funB);
    gradBBD1=gradFD('BD1',x,step(itS),funB);
    gradBCD2=gradFD('CD2',x,step(itS),funB);
    gradBFD2=gradFD('FD2',x,step(itS),funB);
    gradBBD2=gradFD('BD2',x,step(itS),funB);
    gradBCD4=gradFD('CD4',x,step(itS),funB);
    gradBFD3=gradFD('FD3',x,step(itS),funB);
    gradBBD3=gradFD('BD3',x,step(itS),funB);
    gradBCD6=gradFD('CD6',x,step(itS),funB);
    %compute errors
    errFD1(itS)=abs(gradBFD1.GZeval-GZ)/abs(GZ);
    errBD1(itS)=abs(gradBBD1.GZeval-GZ)/abs(GZ);
    errCD2(itS)=abs(gradBCD2.GZeval-GZ)/abs(GZ);
    errFD2(itS)=abs(gradBFD2.GZeval-GZ)/abs(GZ);
    errBD2(itS)=abs(gradBBD2.GZeval-GZ)/abs(GZ);
    errCD4(itS)=abs(gradBCD4.GZeval-GZ)/abs(GZ);
    errFD3(itS)=abs(gradBFD3.GZeval-GZ)/abs(GZ);
    errBD3(itS)=abs(gradBBD3.GZeval-GZ)/abs(GZ);
    errCD6(itS)=abs(gradBCD6.GZeval-GZ)/abs(GZ);
end

%plots
figure
loglog(step,errFD1,'b')
hold on
loglog(step,errBD1,'k')
loglog(step,errCD2,'r')
loglog(step,errFD2,'c')
loglog(step,errBD2,'m')
loglog(step,errCD4,'k-.')
loglog(step,errFD3,'c-.')
loglog(step,errBD3,'m-.')
loglog(step,errCD6,'r-.')
legend('FD1','BD1','CD2','FD2','BD2','CD4','FD3','BD3','CD6')
title('Errors on derivatives for different FD schemes')
xlabel('Stepsize','Interpreter','latex')
ylabel('Error','Interpreter','latex');
