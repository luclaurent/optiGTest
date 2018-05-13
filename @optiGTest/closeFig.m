%% close all openned figures
function closeFig(obj)
if ~isempty(obj.figureHandle)
    %use temporary list of figures
    tmpFigHandle=obj.figureHandle;
    for itF=1:numel(tmpFigHandle)
        %close figure
        %try
        close(tmpFigHandle(itF));
        %catch
        %    keyboard
        %end
        %remove it from the list
        obj.figureHandle=1;
    end
end
end