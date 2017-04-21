%% Dixon & Price's function
%L. LAURENT -- 15/11/2016 -- luc.laurent@lecnam.net
%
%one local minimum
%1 global minimum : x={(4.70104,3.15294),(?1.58214, ?3.13024)} >> f(x)=?106.764537
%
%design space -10<xi<10


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