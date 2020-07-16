%% Constraint function used in problems: Townsend
%L. LAURENT -- 02/05/2018 -- luc.laurent@lecnam.net

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

function [g,dg]=funConsTownsend(xx)

%constants
a=2;
b=1/2;
c=1/4;
d=1/8;
e=3;
f=4;

% contraint
xxx=xx(:,:,1);
yyy=xx(:,:,2);
%
t=atan2(xxx,yyy);
st=sin(t);
ct=cos(t);
cat=cos(a*t);
cet=cos(e*t);
cft=cos(f*t);
%
td=a*ct-b*cat-c*cet-d*cft;
%
g=xxx.^2+yyy.^2-f*st.^2-td.^2;

%and their derivatives
if nargout>1
    dtx=yyy./(xxx.^2+yyy.^2);
    dty=-xxx./(xxx.^2+yyy.^2);
    %
    sat=sin(a*t);
    set=sin(e*t);
    sft=sin(f*t);
    %
    dg(:,:,1)=2*xxx-2*f*dtx.*ct.*st-2*dtx.*(-a*st+sat+e*c*set+b*sft).*td;
    dg(:,:,2)=2*yyy-2*f*dty.*ct.*st-2*dty.*(-a*st+sat+e*c*set+b*sft).*td;
end
end
