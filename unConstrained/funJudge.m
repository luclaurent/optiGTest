%% Judge function
%L. LAURENT -- 16/03/2017 -- luc.laurent@lecnam.net

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
%global minimum : f(x)=16.0817307 for x=[0.86479 1.2357]
%
%Design space: -10<xi<10
%


function [p,dp]=funJudge(xx)
%constants
m=20;
C=[4.284, 4.149, 3.877, 0.533, 2.211,...
    2.389, 2.145, 3.231, 1.998, 1.379,...
    2.106, 1.428, 1.011, 2.179, 2.858,...
    1.388, 1.651, 1.593, 1.046, 2.152];
C=reshape(C,1,1,m);

B=[0.286, 0.973, 0.384, 0.276, 0.973,...
    0.543, 0.957, 0.948, 0.543, 0.797,...
    0.936, 0.889, 0.006, 0.828, 0.399,...
    0.617, 0.939, 0.784, 0.072, 0.889];
B=reshape(B,1,1,m);

A=[0.645, 0.585, 0.310, 0.058, 0.455,...
    0.779, 0.259, 0.202, 0.028, 0.099,...
    0.142, 0.296, 0.175, 0.180, 0.842,...
    0.039, 0.103, 0.620, 0.158, 0.704];
A=reshape(A,1,1,m);


%evaluation and derivatives
x=xx(:,:,1);
y=xx(:,:,2);
%
pa=x+B.*y+A.*y.^2-C;
%
p=sum(pa.^2,3);

%
if nargout==2
    %
    dp=zeros(size(xx));
    %
    dp(:,:,1)=sum(2*pa,3);
    dp(:,:,2)=sum(2*(B+2*A.*y).*pa,3);
end
end
