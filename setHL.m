function setHL (handles,frequenz,dbhl, modus)

hold on;

switch modus
    
    case 1  % linkes Ohr
        current_marker = 'b--o';
        mark ='o';
        
    case 2  % rechtes Ohr
        current_marker = 'g--*';
        mark ='*';
        
    case 3  % beide Ohren
        current_marker = 'r--+';
        mark ='+';
end
  
  dataH = get(gca,'Children');

  if ~ isempty(dataH)
    
    for ii = 1:length(dataH)
        
        lin = dataH(ii);
        
        if ( lin.Marker == mark  & (lin.XData == frequenz))
            delete(lin);
        end
        
    end
    
  end 
     plot(handles.axes1,frequenz,dbhl,current_marker);
     
  end
