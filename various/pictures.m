%%%% Create pcture for all cases
clear all
close all

%% add root to path
addpath('..')

%load class
pb=optiGTest('');

listCase={'unConstrained','Constrained','MultiObj'};
listLoadFile={'loadDimUn','loadDimCons','loadDimMulti'};

for itC = 1:numel(listCase)
    %file for wiki
    ff=fopen([listCase{itC} '.txt'],'w');
    % load list of functions
    listFun=feval(listLoadFile{itC});
    % names of functions
    nameFun=fieldnames(listFun);
    % along functions
    for itF=1:numel(nameFun)
        
        %dimension 2 only
        if any(ismember(listFun.(nameFun{itF}),2))||any(isinf(listFun.(nameFun{itF})))
            %load function
            pb.namePb=nameFun{itF};
            disp(itF)
            disp(nameFun{itF});
            %plot demo
            h=pb.demo;
            %create dir
            if ~exist(fullfile('wiki','Figures',listCase{itC}),'dir')
                mkdir(fullfile('wiki','Figures',listCase{itC}));
            end
            %obtain pdf and png
            file=fullfile('wiki','Figures',listCase{itC},nameFun{itF});
            %fileEPS=[file,'.eps'];
            %filePDF=[file,'.pdf'];
            filePNG=[file,'.png'];
            %saveas(h(end),fileEPS,'epsc')
            %print(h(end),filePDF,'-dpdf','-painters')
            saveas(h(end),filePNG)
            %close figure
            pb.closeFig;
            %write in the wiki's file
            fprintf(ff,'#%s\n',nameFun{itF});
            fprintf(ff,'![%s](%s)\n',nameFun{itF},...
                filePNG);
        end
    end
    fclose(ff);
end