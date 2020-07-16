%% custom surface plot
function surfCustom(XX,YY,ZZ)
%
hh=surf(XX,YY,ZZ);
%
shading interp
light
lighting phong
%
axis('tight','square')
xlabel('$x$','Interpreter','latex')
ylabel('$y$','Interpreter','latex')
zlabel('$f$','Interpreter','latex')
%title(obj.funName)
%
%% Extract X,Y and Z data from surface plot
X=hh.XData;
Y=hh.YData;
Z=hh.ZData;
%% Divide the lengths by the number of lines needed
xlength = size(ZZ,2);
ylength = size(ZZ,1);
xnumlines = 10; % 10 lines
ynumlines = 10; % 10 partitions
xspacing = round(xlength/xnumlines);
yspacing = round(ylength/ynumlines);
%% Plot the mesh lines
% Plotting lines in the X-Z plane
hold on
for i = 1:yspacing:ylength
    mesh([X(i,:);X(i,:)], [Y(i,:);Y(i,:)], [Z(i,:);Z(i,:)],'EdgeColor',0.7.*[1,1,1]);
end
% Plotting lines in the Y-Z plane
for i = 1:xspacing:xlength
    mesh([X(:,i),X(:,i)], [Y(:,i),Y(:,i)], [Z(:,i),Z(:,i)],'EdgeColor',0.7.*[1,1,1]);
end
hold off
end