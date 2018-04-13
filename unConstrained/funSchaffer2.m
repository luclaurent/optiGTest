%% Schaffer 2 function
% L. LAURENT -- 15/02/2017 -- luc.laurent@lecnam.net

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

%1 minimum global: f(0,0)=0
%
%Design space -100<xi<100


function [p,dp] = funSchaffer2(xx)

%constants
a=0.5;
b=1;
c=0.001;

%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
xay=x.^2+y.^2;
xmy=x.^2-y.^2;
sxy=sin(xmy);
pa=sxy.^2-a;
pb=b+c*xay.^2;
%
p=a+pa./pb;

if nargout==2
    %
    dp=zeros(size(xx));
    cxy=cos(xmy);
    dpax=4*x.*sxy.*cxy;
    dpay=-4*y.*sxy.*cxy;
    dpbx=4*c*x.*xay;
    dpby=4*c*y.*xay;
    dp(:,:,1)=(dpax.*pb-pa.*dpbx)./pb.^2;
    dp(:,:,2)=(dpay.*pb-pa.*dpby)./pb.^2;
end
end
