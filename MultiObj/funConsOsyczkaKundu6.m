%% Osyczka and Kundu 6th constraint function
%L. LAURENT -- 09/05/2018 -- luc.laurent@lecnam.net

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

function [p,dp]=funConsOsyczkaKundu6(xx)

%constants
a=4;
b=3;

%responses and derivatives
vvv=xx(:,:,5);
www=xx(:,:,6);
%
p=(vvv-b).^2+www-a;

if nargout==2
    %
    dp=zeros(size(xx));
    %
    dp(:,:,5)=2*(vvv-b);
    dp(:,:,6)=ones(size(www));
end
end
