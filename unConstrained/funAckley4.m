%% Ackley's function 4 (Modified Ackley Function)
%L. LAURENT -- 31/10/2016 -- luc.laurent@lecnam.net

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
%numerous local minima
%xx global minimum : UNDEFINED
% in dimension 2: x{-1.479252, -0.739807), (1.479252, -0.739807)} >> f(x)=-3.917275
%
%design space -35<xi<35 (small range -2<xi<2)



function [p,dp]=funAckley4(xx)

%constants
a=0.2;
b=3;
c=2;

%number of variables
nbvar=size(xx,3);

%responses and derivatives
ex1=exp(-a);
normP=zeros(size(xx,1),size(xx,2),nbvar-1);
for itV=1:nbvar-1
    normP(:,:,itV)=sqrt(xx(:,:,itV).^2+xx(:,:,itV+1).^2);
end
cx=cos(c*xx(:,:,1:end-1));
sx=sin(c*xx(:,:,2:end));
p=sum(ex1.*normP+b*(cx+sx),3);


if nargout==2
    dp=zeros(size(xx));
    for ii=1:nbvar
        if ii==1
            dp(:,:,ii)=ex1*xx(:,:,1)./normP(:,:,1)-c*b*sin(c*xx(:,:,1));
        elseif ii==nbvar
            dp(:,:,ii)=ex1*xx(:,:,nbvar)./normP(:,:,end)+c*b*cos(c*xx(:,:,nbvar));
        else
            dp(:,:,ii)=ex1*xx(:,:,ii)./normP(:,:,ii)-c*b*sin(c*xx(:,:,ii))...
                +ex1*xx(:,:,ii+1)./normP(:,:,ii+1)+c*b*cos(c*xx(:,:,ii+1));
        end
    end
end
end
