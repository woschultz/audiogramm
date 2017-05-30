function resetmeasures(handles)

set(handles.slider1,'Value',5);

set(handles.slider1,'UserData','-5');

updatePanelTitle(handles)

dataH = get(gca,'Children');

  if ~ isempty(dataH) 
      
    for ii = 1:length(dataH)
        
      delete( dataH(ii)); 
      
    end
        
  end
end
      