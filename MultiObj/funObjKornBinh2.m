%% Binh and Korn 2nd objective function
%L. LAURENT -- 07/05/2018 -- luc.laurent@lecnam.net

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

function [p,dp]=funObjKornBinh2(xx)

%constants
a=5;

%responses and derivatives
xxx=xx(:,:,1);
yyy=xx(:,:,2);
%
p=(xxx-a).^2+(yyy-a).^2;

if nargout==2
    %
    dp(:,:,1)=2*(xxx-a);
    dp(:,:,2)=2*(yyy-a);
end
end