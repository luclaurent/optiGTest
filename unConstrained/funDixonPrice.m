%% Dixon & Price's function
%L. LAURENT -- 15/11/2016 -- luc.laurent@lecnam.net
%
%one local minimum
%1 global minimum : x={(4.70104,3.15294),(?1.58214, ?3.13024)} >> f(x)=?106.764537
%
%design space -10<xi<10

%     GRENAT - GRadient ENhanced Approximation Toolbox
%     A toolbox for generating and exploiting gradient-enhanced surrogate models
%     Copyright (C) 2016  Luc LAURENT <luc.laurent@lecnam.net>
%
%     This program is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
%
%     This program is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
%
%     You should have received a copy of the GNU General Public License
%     along with this program.  If not, see <http://www.gnu.org/licenses/>.

function [p,dp]=funDixonPrice(xx)

%constants
a=1;
b=2;

%evaluations and derivatives
dim=size(xx,3);
pa=(xx(:,:,1)-a).^2;
ii=reshape(2:dim,1,1,[]);
pb=b*xx(:,:,2:end).^2-xx(:,:,1:end-1);
pc=bsxfun(@times,pb.^2,ii);
p=pa+sum(pc,3);

if nargout==2
    pd=bsxfun(@times,pb,ii);
    %    
    dp=zeros(size(xx));
    dp(:,:,1)=2*(xx(:,:,1)-a)-2*pd(:,:,1);
    for it=2:dim-1
        try
        dp(:,:,it)=4*b*it*xx(:,:,it).*pb(:,:,it-1)...
            -2*(it+1)*pb(:,:,it);
        catch
            keyboard
        end
    end    
    dp(:,:,dim)=4*b*dim.*xx(:,:,end).*pb(:,:,end);
end
end