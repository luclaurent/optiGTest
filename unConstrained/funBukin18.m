%% Bukin 18's function
%L. LAURENT -- 01/11/2016 -- luc.laurent@lecnam.net
%



function [p,dp]=funBukin18(xx)

%constants
a=1000;
b=15;
c=80;
d=21;
e=100;
f=17;
g=90;


%evaluation and derivatives
pa=xx(:,:,2)+b*xx(:,:,1)+c;
pb=xx(:,:,2)-d*xx(:,:,1)-e;
pc=e*xx(:,:,1)+xx(:,:,2)-e;
pd=f*xx(:,:,1)+xx(:,:,2)+g;
p=a*abs(pa.*pb.*pc)+abs(pd);
if nargout==2
    dp(:,:,1)=a*(b*pb.*pc-d*pa.*pc+e*pa.*pb).*sign(pa.*pb.*pc)+sign(pd);
    dp(:,:,2)=a*(pb.*pc+pa.*pc+pa.*pb).*sign(pa.*pb.*pc)+sign(pd);   
end
end

