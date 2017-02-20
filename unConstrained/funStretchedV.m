%% StretchedV function
% L. LAURENT -- 20/02/2017 -- luc.laurent@lecnam.net

%1 minimum global: f(-9.38723188,9.34026753)=0
%
%Design space -10<xi<10


function [p,dp] = funStretchedV(xx)


%constants
a=1/4;
b=50;
c=0.1;
d=1;

%evaluation and derivatives
sX=size(xx);
%
funG=@(x,y)(x.^2+y.^2);
%
xkp=xx(:,:,2:end);
xk=xx(:,:,1:end-1);
pa=funG(xkp,xk).^a.*(sin(b*funG(xkp,xk).^c)+d).^2;
%
p=sum(pa,3);

if nargout==2
    %
    fundG=@(x)2*x;
    %
    dp=zeros(sX);
    %
    for itX=1:sX(3)
        if itX==1
            x=xx(:,:,2);
            y=xx(:,:,1);
            dp(:,:,itX)=a*fundG(y).*funG(x,y).^(a-1) ...
                .*(sin(b*funG(x,y).^c)+d).^2 ...
                + 2*funG(x,y).^a*c*b.*fundG(y).*funG(x,y).^(c-1) ...
                .*cos(b*funG(x,y).^c).*(sin(b*funG(x,y).^c)+d);
        elseif itX==sX(3)
            x=xx(:,:,sX(3));
            y=xx(:,:,sX(3)-1);
            dp(:,:,itX)=a*fundG(x).*funG(x,y).^(a-1) ...
                .*(sin(b*funG(x,y).^c)+d).^2 ...
                + 2*funG(x,y).^a*c*b.*fundG(x).*funG(x,y).^(c-1) ...
                .*cos(b*funG(x,y).^c).*(sin(b*funG(x,y).^c)+d);
        else
            xk=xx(:,:,itX);
            xkp=xx(:,:,itX+1);
            xkm=xx(:,:,itX-1);
            dp(:,:,itX)=a*fundG(xk).*funG(xk,xkm).^(a-1) ...
                .*(sin(b*funG(xk,xkm).^c)+d).^2 ...
                + 2*funG(xk,xkm).^a*c*b.*fundG(xk).*funG(xk,xkm).^(c-1) ...
                .*cos(b*funG(xk,xkm).^c).*(sin(b*funG(xk,xkm).^c)+d) ...
                +a*fundG(xk).*funG(xkp,xk).^(a-1) ...
                .*(sin(b*funG(xkp,xk).^c)+d).^2 ...
                + 2*funG(xkp,xk).^a*c*b.*fundG(xk).*funG(xkp,xk).^(c-1) ...
                .*cos(b*funG(xkp,xk).^c).*(sin(b*funG(xkp,xk).^c)+d);
        end
    end
end
end
