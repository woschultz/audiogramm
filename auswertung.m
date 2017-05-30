function auswertung(handles)

lo = [];
ro = [];
bo = [];

dataH = get(gca,'Children');

  if ~ isempty(dataH) 
      
    for ii = 1:length(dataH)
       
     lin = dataH(ii);        
     
     td = length(lin.XData);
     
         switch lin.Marker
             
             
             case 'o' 
                              
                 if td == 1
                 
                  lo(1,end+1) =   double(lin.XData);
                 
                  lo(2,end)   =   double(lin.YData);  
                                
                 end
                 
             case '*'
                 
               
                 if td == 1
                 
                  ro(1,end+1) = lin.XData;
                 
                  ro(2,end) = lin.YData;  
                                
                 end
                                         
             case '+' 
                 
                 
                 if td == 1
                 
                  bo(1,end+1) = lin.XData;
                 
                  bo(2,end) = lin.YData;  
                                
                 end
         end
    end
        
  if ~ isempty(lo)
     
   lo = sortrows(lo.',1).' ;
      
   hold on;
   
   plot(handles.axes1,lo(1,:),lo(2,:),'b--o');
   
  end
  
   if ~ isempty(ro)
       
   ro = sortrows(ro.',1).' ;   
      
   hold on;
   
   plot(handles.axes1,ro(1,:),ro(2,:),'g--*');
   
   end
    
    if ~ isempty(bo)
     
     bo = sortrows(bo.',1).' ;   
        
     hold on;
   
     plot(handles.axes1,bo(1,:),bo(2,:),'r--+');
   
    end
  
  end % endif ~ isempty(dataH) 
end
 