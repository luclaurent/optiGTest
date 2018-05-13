%% Fonseca-Fleming 1st objective function
%L. LAURENT -- 07/05/2018 -- luc.laurent@lecnam.net

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

function [p,dp]=funObjFonsecaFleming1(xx)

%responses and derivatives
n=size(xx,3);
%
td=xx-1/sqrt(n);
st=sum(td.^2,3);
%
p=1-exp(-st);
%
if nargout==2
    %
    dp=2*td.*exp(-st);
end
end
