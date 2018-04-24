%%%% Create pitcures for all cases

%% unconstrained


addpath('..')

%load class
pb=unConstrained('');
% load list of functions
listFun=loadDim();
% names of functions
nameFun=fieldnames(listFun);
% along functions
for itF=1:numel(nameFun{1:4})
    disp(itF)
    %dimension 2 only
    if ismember(listFun.(nameFun{itF}),2)||any(isinf(listFun.(nameFun{itF})))
        %load function
        pb.funName=nameFun{itF};
        %plot demo
        h=pb.demo;
        %obtain pdf and png
        file=fullfile('unConstrained',nameFun{itF});
        filePDF=[file,'.pdf'];
        filePNG=[file,'.png'];
        %saveas(h,fileEPS,'-epsc')
        print(h,filePDF,'-dpdf','-painters')
        saveas(h,filePNG)
        %close figure
        pb.closeFig;
    end
end