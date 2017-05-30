function  playton(handles)
 
  hearLevel = -1 * get(handles.slider1,'Value');

  frequenz  = handles.uibuttongroup2.SelectedObject.UserData;

  modus     = handles.uibuttongroup1.SelectedObject.UserData;
  
  % hier den sound aus matrix holen
 
  if hearLevel < 0
      hearLevel = 0;
  end
  
  [n,m] = toneindex(hearLevel,frequenz);
  
  sounds = handles.sounds.ans(n,m);
  
  soundfrommatrix(:,1) = sounds{1};

  % ende sound
  

  switch modus
    
    case 1  % linkes Ohr abspielen
        
         soundfrommatrix(:,2) = zeros(length(soundfrommatrix),1);
         
         player = audioplayer(soundfrommatrix,44100);
  
         player.StopFcn=@playerstopped;
         
         handles.taste = false;
         
         player.UserData = handles;
         
         play(player);   
         

         
         k = waitforbuttonpress;
                
          if k == 1
              
           handles.taste = true;
           
           player.UserData = handles;
           
           stop(player);
           
         end
         
    case 2  % rechtes Ohr abspielen
        
         soundfrommatrix(:,2) = soundfrommatrix(:,1);
         
         soundfrommatrix(:,1) = zeros(length(soundfrommatrix),1);
         
         player = audioplayer(soundfrommatrix,44100);
  
         player.StopFcn=@playerstopped;
         
    
         play(player);       
         
         handles.taste = false;
         
         player.UserData = handles;
         
         handles.myply = player;
         
         k = waitforbuttonpress;
         
         if k == 1
             
           handles.taste = true;
           
           player.UserData = handles;
           
           stop(player);
           
         end
          
        
    case 3  % beide Ohren abspielen
        
         soundfrommatrix(:,2) = soundfrommatrix(:,1);
         
         player = audioplayer(soundfrommatrix,44100);
  
         player.StopFcn=@playerstopped;
 
         play(player); 
         
        
         
         handles.taste = false;
         
         player.UserData = handles;
         
         
         
         k = waitforbuttonpress;
         
         if k == 1
             
           handles.taste = true;
           
           player.UserData = handles;
           
           stop(player);
           
         end
       
  end
  
    
  
end
  
  
 

  