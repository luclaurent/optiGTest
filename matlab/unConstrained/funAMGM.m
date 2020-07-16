%% AMGM function (Arthmetic Mean - Geometric Mean)
%L. LAURENT -- 13/03/2017 -- luc.laurent@lecnam.net

% sources available here:
% https://bitbucket.org/luclaurent/optigtest/
% https://github.com/luclaurent/optigtest/

% optiGTest - set of testing functions    A toolbox to easy manipulate functions.
% Copyright (C) 2017  Luc LAURENT <luc.laurent@lecnam.net>
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

%
%global minimum : f(x)=0 for x1=x2=x3=...=xn
%
%Design space: 0<xi<10


function [p,dp]=funAMGM(xx)

%variables
dim=size(xx,3);

%evaluation and derivatives
pa=sum(xx,3);
pb=prod(xx,3);
pc=1/dim*pa-pb.^(1/dim);
%
p=pc.^2;

if nargout==2
    %
    funP=@(i)prod(xx(:,:,[1:i-1 i+1:end]),3);
    pdA=arrayfun(funP,1:dim,'UniformOutput',false);
    pdA=cell2mat(reshape(pdA,1,1,dim));
    %
    pdB=1/dim-pdA.*pb.^(1/dim-1)./dim;
    %
    dp=2*pdB.*pc;
end
end
