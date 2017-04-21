%% Bukin 17's function
%L. LAURENT -- 01/11/2016 -- luc.laurent@lecnam.net
%



function [p,dp]=funBukin17(xx)

%constants
a=1000;
b=2;
c=10;
d=3;


%evaluation and derivatives
pa=xx(:,:,2)+b*xx(:,:,1)-c;
pb=d*xx(:,:,2)-xx(:,:,1)+c;
pc=d*xx(:,:,1)-xx(:,:,2)+c;
pd=xx(:,:,1)+xx(:,:,2)+c;
p=a*abs(pa.*pb.*pc)+abs(pd);
if nargout==2
    dp(:,:,1)=a*(b*pb.*pc-pa.*pc+d*pa.*pb)*sign(pa.*pb.*pc)+sign(pd);
    dp(:,:,2)=a*(pb.*pc+d*pa.*pc-pa.*pb)*sign(pa.*pb.*pc)+sign(pd);   
end
end

