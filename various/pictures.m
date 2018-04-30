%%%% Create pitcures for all cases
clear all
close all

%% unconstrained
addpath('..')

%file for wiki
ff=fopen('unConstrainedWiki.txt','w');

%load class
pb=unConstrained('');
% load list of functions
listFun=loadDim();
% names of functions
nameFun=fieldnames(listFun);
% along functions
for itF=1:numel(nameFun)
    disp(itF)
    %dimension 2 only
    if any(ismember(listFun.(nameFun{itF}),2))||any(isinf(listFun.(nameFun{itF})))
        %load function
        pb.funName=nameFun{itF};
        %plot demo
        h=pb.demo;
        %% Extract X,Y and Z data from surface plot
        X=h.XData;
        Y=h.YData;
        Z=h.ZData;
        %% Divide the lengths by the number of lines needed
        xlength = size(Z,2);
        ylength = size(Z,1);
        xnumlines = 10; % 10 lines
        ynumlines = 10; % 10 partitions
        xspacing = round(xlength/xnumlines);
        yspacing = round(ylength/ynumlines);
        %% Plot the mesh lines
        % Plotting lines in the X-Z plane
        hold on
        for i = 1:yspacing:ylength
            mesh([X(i,:);X(i,:)], [Y(i,:);Y(i,:)], [Z(i,:);Z(i,:)]);
        end
        % Plotting lines in the Y-Z plane
        for i = 1:xspacing:xlength
            mesh([X(:,i),X(:,i)], [Y(:,i),Y(:,i)], [Z(:,i),Z(:,i)]);
        end
        hold off
        keyboard
        %obtain pdf and png
        file=fullfile('unConstrained',nameFun{itF});
        filePDF=[file,'.pdf'];
        filePNG=[file,'.png'];
        %saveas(h,fileEPS,'-epsc')
        print(h,filePDF,'-dpdf','-painters')
        saveas(h,filePNG)
        %close figure
        pb.closeFig;
        %write in the wiki's file
        fprintf(ff,'#%s\n',nameFun{itF});
        fprintf(ff,'![%s](%s)\n',nameFun{itF},...
            ['https://bitbucket.org/luclaurent/optigtest/raw/master/various/',filePNG]);
    end
end
fclose(ff);