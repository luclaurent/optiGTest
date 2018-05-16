%% Method of optiGTest class
% L. LAURENT --  15/04/2018 -- luc.laurent@lecnam.net

% sources available here:
% https://bitbucket.org/luclaurent/optigtest/
% https://github.com/luclaurent/optigtest/

% optiGTest - set of testing functions    A toolbox to easy manipulate functions.
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

%% prepare the sample point for evaluation
%% show 1D function
% INPUTS:
%  - XX: input sample points (not prepared for evaluation) [optional]
% OUTPUTS:
%  - Xeval: sample points ready for evaluation

function Xeval=prepX(obj,XX)
%load sizes
sX=[size(XX,1) size(XX,2) size(XX,3)];
%different cases
if sX(3)==1&&sX(2)==1
    nbVar=1;
elseif sX(3)==1&&sX(2)>1
    nbVar=sX(2);
else
    nbVar=sX(3);    
end
%check dimension
if ~any(isinf(obj.dimAvailable))
    if ~any(nbVar==obj.dimAvailable)
        error(['Wrong size of sample points (' mfilename ')']);
    end
end
%load dimension
obj.dim=nbVar;

if nbVar==1
    obj.Xeval=XX(:);
else
    if sX(3)==1
        obj.Xeval=reshape(XX,[],1,sX(2));
    else
        obj.Xeval=XX;
    end
end

Xeval=obj.Xeval;
end