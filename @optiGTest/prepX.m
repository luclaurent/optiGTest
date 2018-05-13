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
sX=[size(XX,1) size(XX,2) size(XX,3)];
nbvar=sX(3);
if any(isinf(obj.dimAvailable))
    if nbvar==1
        obj.Xeval=reshape(XX,[],1,sX(2));
    else
        obj.Xeval=XX;
        obj.dim=nbvar;
    end
else
    if nbvar==obj.dim
        obj.Xeval=XX;
    elseif nbvar==1
        if sX(2)==obj.dim
            obj.Xeval=reshape(XX,[],1,sX(2));
        else
            fprintf(['Wrong size of sample points (' mfilename ')\n']);
        end
    else
        fprintf(['Wrong size of sample points (' mfilename ')\n']);
    end
end
Xeval=obj.Xeval;
end