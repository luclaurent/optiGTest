%% Normalised Peaks function
%L. LAURENT -- 12/05/2010 -- luc.laurent@lecnam.net

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


function [p,dp]=funPeaksN(xx)
%responses and derivatives
xxx=4*xx(:,:,1);
yyy=4*xx(:,:,2);

p =  3*(1-xxx).^2.*exp(-(xxx.^2) - (yyy+1).^2) ...
    - 10*(xxx/5 - xxx.^3 - yyy.^5).*exp(-xxx.^2-yyy.^2) ...
    - 1/3*exp(-(xxx+1).^2 - yyy.^2);

p=p/7.5;

if nargout==2
    dp(:,:,1)=-6*(1-xxx).*exp(-(xxx.^2) - (yyy+1).^2)...
        -6*xxx.*(1-xxx).^2.*exp(-xxx.^2-(yyy+1).^2) ...
        -10*(1/5-3*xxx.^2).*exp(-xxx.^2-yyy.^2)...
        +20*(xxx/5-xxx.^3-yyy.^5).*xxx.*exp(-xxx.^2-yyy.^2)...
        +2/3*(xxx+1).*exp(-(xxx+1).^2-yyy.^2);
    dp(:,:,2)=-6*(1-xxx).^2.*(yyy+1).*exp(-xxx.^2-(yyy+1).^2)...
        +50*yyy.^4.*exp(-xxx.^2-yyy.^2)...
        +20*yyy.*(xxx/5-xxx.^3-yyy.^5).*exp(-xxx.^2 -yyy.^2)...
        +2/3*yyy.*exp(-(xxx+1).^2-yyy.^2);
    dp=4*dp/7.5;
end

end