%% Rotated Ellipse function 1
% L. LAURENT -- 14/02/2017 -- luc.laurent@lecnam.net

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
%Design space -500<xi<500


function [p,dp] = funRotatedEllipse1(xx)


%evaluation and derivatives
p=xx(:,:,1).^2-xx(:,:,1).*xx(:,:,2)+xx(:,:,2).^2;


if nargout==2
    %
    dp=zeros(size(xx));
    dp(:,:,1)=2*xx(:,:,1)-xx(:,:,2);
    dp(:,:,2)=-xx(:,:,1)+2*xx(:,:,2);
end
end
