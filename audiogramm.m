function varargout = audiogramm(varargin)
% AUDIOGRAMM MATLAB code for audiogramm.fig
%      AUDIOGRAMM, by itself, creates a new AUDIOGRAMM or raises the existing
%      singleton*.
%
%      H = AUDIOGRAMM returns the handle to a new AUDIOGRAMM or the handle to
%      the existing singleton*.
%
%      AUDIOGRAMM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AUDIOGRAMM.M with the given input arguments.
%
%      AUDIOGRAMM('Property','Value',...) creates a new AUDIOGRAMM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before audiogramm_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to audiogramm_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help audiogramm

% Last Modified by GUIDE v2.5 30-May-2017 21:26:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @audiogramm_OpeningFcn, ...
                   'gui_OutputFcn',  @audiogramm_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before audiogramm is made visible.
function audiogramm_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to audiogramm (see VARARGIN)

% Choose default command line output for audiogramm

handles.output = hObject;

handles.robot = java.awt.Robot;

filename = 'soundmatrix3.mat';

if exist(filename,'file')
  handles.sounds = load(filename);
else
  
  % hier kann erstmalig die soundmatrix erzeugt werden
  % noch nicht implementiert
    
  uiwait(errordlg('soundmatrix3.mat nicht gefunden','Tondatei fehlt'));
  
  set(findobj(handles.uibuttongroup2,'Style','radiobutton'),'Enable','off');
  
  set(findobj(handles.uibuttongroup1,'Style','radiobutton'),'Enable','off')
  
  set(handles.slider1,'Enable','off');
  
end

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes audiogramm wait for user response (see UIRESUME)
% uiwait(handles.figure1);

set(handles.slider1,'UserData','-5');

updatePanelTitle(handles);

addlistener(handles.slider1,'ContinuousValueChange',@updateHearLevel);


% --- Outputs from this function are returned to the command line.
function varargout = audiogramm_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


 set(hObject,'UserData',get(hObject,'Value'));
 
 set(findobj(handles.uibuttongroup2,'Style','radiobutton'),'Enable','off');
 
 set(findobj(handles.uibuttongroup1,'Style','radiobutton'),'Enable','off');
 
 set(handles.pushbutton3,'Enable','off');
 
 set(handles.pushbutton2,'Enable','off');
 
 set(hObject,'Enable','off');
 
 set(handles.uipanel1,'ForegroundColor',[0.0 1.0 0.0]);

 playton(handles);
 
 set(handles.uipanel1,'ForegroundColor',[0.0 0.0 0.0]);
 
 set(hObject,'Enable','on');
 
 set(findobj(handles.uibuttongroup2,'Style','radiobutton'),'Enable','on');
 
 set(findobj(handles.uibuttongroup1,'Style','radiobutton'),'Enable','on');
 
 set(handles.pushbutton3,'Enable','on');
 
 set(handles.pushbutton2,'Enable','on')

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function updateHearLevel(hObject,eventdata)

vl = -1 * int16(get(hObject,'Value'));
    
    if (vl == -5)
      
      r = -5;
      
      hObject.UserData  = r; 
        
    else
    
    r = round(vl/5) * 5;
    
    hObject.UserData  = r;
    
    end 
    
    set(hObject,'Value', -1 * hObject.UserData);
    
     
    myhandles = guidata(hObject.Parent);
    
    updatePanelTitle(myhandles);
    

% --- Executes when selected object is changed in uibuttongroup2.
function uibuttongroup2_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup2 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.slider1,'Value',5);

set(handles.slider1,'UserData','-5');

updatePanelTitle(handles)





% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup1 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.slider1,'Value',5);

set(handles.slider1,'UserData','-5');

updatePanelTitle(handles)




% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
choice = questdlg('Wollen Sie die Messungen verwerfen? ', ...
	'Rücksetzen', ...
	'Ja','Nein','Nein');
switch choice
    case 'Ja'
    resetmeasures(handles);    
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
auswertung(handles);


% --- Executes on key press with focus on figure1 and none of its controls.
function figure1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

if get(handles.slider1,'Enable')== "off"
    return;
end

switch eventdata.Key
    
    case 'downarrow'
              
        t=get(handles.slider1,'Value');
        
        set(handles.slider1,'Value',t-5);
        
        updateHearLevel(handles.slider1,eventdata);
        
        slider1_Callback(handles.slider1, eventdata, handles);
          
        handles.keyignore = true;
        
    case 'uparrow'
                   
        t=get(handles.slider1,'Value');
        
        if (t == 5) return; end;
        
        set(handles.slider1,'Value',t+5); 
        
        updateHearLevel(handles.slider1,eventdata);
        
        slider1_Callback(handles.slider1, eventdata, handles); 
        
        handles.keyignore = true;
        
    case 'rightarrow'
             
        rb = handles.uibuttongroup2.Children;
        
        selected_found = false;
        
        for i=length(rb):-1:1
            
            if get(rb(i),'Value') == 1              
                selected_found = true;
                continue;
            end
            if selected_found
               set(rb(i),'Value',1)
               uibuttongroup2_SelectionChangedFcn(rb(i), eventdata, handles);
               break;
            end
                     
        end
        
        
    case 'leftarrow'
        
        rb = handles.uibuttongroup2.Children;
        
        selected_found = false;
        
        for i=1:length(rb)
            
            if get(rb(i),'Value') == 1              
                selected_found = true;
                continue;
            end
            if selected_found
               set(rb(i),'Value',1);
               uibuttongroup2_SelectionChangedFcn(rb(i), eventdata, handles);
               break;
            end
                     
        end
                     
end 
 


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
figure(gcf)
drawnow
handles.robot.mousePress(java.awt.event.InputEvent.BUTTON1_MASK);
handles.robot.mouseRelease(java.awt.event.InputEvent.BUTTON1_MASK);


% --------------------------------------------------------------------
function help_Callback(hObject, eventdata, handles)
% hObject    handle to help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
web('https://github.com/woschultz','-browser')

% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function about_Callback(hObject, eventdata, handles)
% hObject    handle to about (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
uiwait(msgbox('Programmierübung "Audiogramm" zur Vorlesung Audiosignalverarbeitung und Neuroakustik SS17. (Team Wolfgang Schultz/ Dominik Weinacht)','Credit'));


% --------------------------------------------------------------------
function lizenz_Callback(hObject, eventdata, handles)
% hObject    handle to lizenz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
uiwait(msgbox('This work is free. You can redistribute it and/or modify it under the terms of the Do What The Fuck You Want To Public License, Version 2, as published by Sam Hocevar. See http://www.wtfpl.net/ for more details.','Lizenz'));
