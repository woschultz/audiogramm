
function updatePanelTitle(handles)

Frequenz = handles.uibuttongroup2.SelectedObject.String;

HearLevel = handles.slider1.UserData;

set (handles.uipanel1,'Title', horzcat('Audiogramm     ',' ', num2str(HearLevel),' ','dB    ',Frequenz));