  function playerstopped(src,eventData)
  
  hearLevel = -1 * get(src.UserData(1).slider1,'Value');

  frequenz  = src.UserData(1).uibuttongroup2.SelectedObject.UserData;

  modus     = src.UserData(1).uibuttongroup1.SelectedObject.UserData;
  
  if (src.UserData(1).taste)
      
      setHL(src.UserData(1),frequenz,hearLevel,modus);
    
  else
      
      src.UserData(1).robot.keyPress(java.awt.event.KeyEvent.VK_ENTER);
      
  end
   
%    auswertung(src.UserData(1).axes1);  
      
  end