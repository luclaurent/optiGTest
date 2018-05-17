%%%% Create pitcures for all cases
clear all
close all

%% unconstrained
addpath('..')

%file for wiki
ff=fopen('Wiki.txt','w');

%load class
pb=optiGTest('');
% load list of functions
listFun=loadDimMulti();
% names of functions
nameFun=fieldnames(listFun);
% along functions
for itF=1:numel(nameFun)
    disp(itF)
    %dimension 2 only
    if any(ismember(listFun.(nameFun{itF}),2))||any(isinf(listFun.(nameFun{itF})))
        %load function
        pb.namePb=nameFun{itF};
        %plot demo
        h=pb.demo;
        %obtain pdf and png
        file=fullfile('various','Figures','MultiObj',nameFun{itF});
        fileEPS=[file,'.eps'];
        filePDF=[file,'.pdf'];
        filePNG=[file,'.png'];
        saveas(h(end),fileEPS,'epsc')
        print(h(end),filePDF,'-dpdf','-painters')
        saveas(h(end),filePNG)
        %close figure
        pb.closeFig;
        %write in the wiki's file
        fprintf(ff,'#%s\n',nameFun{itF});
        fprintf(ff,'![%s](%s)\n',nameFun{itF},...
            ['https://bitbucket.org/luclaurent/optigtest/raw/master/various/',filePNG]);
    end
end
fclose(ff);