function varargout = final(varargin)
% FINAL MATLAB code for final.fig
%      FINAL, by itself, creates a new FINAL or raises the existing
%      singleton*.
%
%      H = FINAL returns the handle to a new FINAL or the handle to
%      the existing singleton*.
%
%      FINAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINAL.M with the given input arguments.
%
%      FINAL('Property','Value',...) creates a new FINAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before final_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to final_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help final

% Last Modified by GUIDE v2.5 26-Jun-2016 22:48:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @final_OpeningFcn, ...
                   'gui_OutputFcn',  @final_OutputFcn, ...
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


% --- Executes just before final is made visible.
function final_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to final (see VARARGIN)

% Choose default command line output for final
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes final wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% play button 
imrawPlay=imread('play-button.jpg');

set(handles.play_test,'unit','pixel');
pos1=get(handles.play_test,'position');
imfit1=imresize(imrawPlay,[pos1(end) pos1(end-1)]);
set(handles.play_test,'Cdata',imfit1);

set(handles.play_sample,'unit','pixel');
pos2=get(handles.play_sample,'position');
imfit2=imresize(imrawPlay,[pos2(end) pos2(end-1)]);
set(handles.play_sample,'Cdata',imfit2);

% play button
imrawPlay=imread('record-button.jpg');

set(handles.record_test,'unit','pixel');
pos3=get(handles.record_test,'position');
imfit3=imresize(imrawPlay,[pos3(end) pos3(end-1)]);
set(handles.record_test,'Cdata',imfit3);

set(handles.record_sample,'unit','pixel');
pos4=get(handles.record_sample,'position');
imfit4=imresize(imrawPlay,[pos4(end) pos4(end-1)]);
set(handles.record_sample,'Cdata',imfit4);

% background

backgroundImage1 = importdata('Music-wallpaper.jpg');
axes(handles.axes2);
image(backgroundImage1);
axis off;


%{
backgroundImage2 = importdata('black-blue-gradient-invert.jpg');
axes(handles.axes2);
image(backgroundImage2);
axis off;
%}

loadSampleFolder(handles);



% pop menu sample
function loadSampleFolder(handles)
TestFiles = dir('sample');
TestList = {};
for i = 1:length(TestFiles)
    filename = TestFiles(i).name;
    if ~strcmp(filename,'.') && ~strcmp(filename,'..') && ~strcmp(filename,'.DS_Store')
        TestList = [TestList ; filename];
    end
end
set(handles.menu_sample,'string',TestList);



% --- Outputs from this function are returned to the command line.
function varargout = final_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in record_sample.
function record_sample_Callback(hObject, eventdata, handles)
% hObject    handle to record_sample (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

display(handles.sample_name);



% do recording for sample 
% get sample data
% 


% --- Executes on button press in play_sample.
function play_sample_Callback(hObject, eventdata, handles)
% hObject    handle to play_sample (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% play all sample data 




% --- Executes on selection change in menu_sample.
function menu_sample_Callback(hObject, eventdata, handles)
% hObject    handle to menu_sample (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns menu_sample contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menu_sample


% --- Executes during object creation, after setting all properties.
function menu_sample_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menu_sample (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in record_test.
function record_test_Callback(hObject, eventdata, handles)
% hObject    handle to record_test (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in play_test.
function play_test_Callback(hObject, eventdata, handles)
% hObject    handle to play_test (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)






% --- Executes on selection change in menu_test.
function menu_test_Callback(hObject, eventdata, handles)
% hObject    handle to menu_test (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns menu_test contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menu_test


% --- Executes during object creation, after setting all properties.
function menu_test_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menu_test (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in button_C.
function button_C_Callback(hObject, eventdata, handles)
% hObject    handle to button_C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in button_D.
function button_D_Callback(hObject, eventdata, handles)
% hObject    handle to button_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in button_E.
function button_E_Callback(hObject, eventdata, handles)
% hObject    handle to button_E (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in button_F.
function button_F_Callback(hObject, eventdata, handles)
% hObject    handle to button_F (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in button_G.
function button_G_Callback(hObject, eventdata, handles)
% hObject    handle to button_G (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in button_A.
function button_A_Callback(hObject, eventdata, handles)
% hObject    handle to button_A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('³¢«a§»¦n«Ó')

% --- Executes on button press in button_B.
function button_B_Callback(hObject, eventdata, handles)
% hObject    handle to button_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in button_C_upper.
function button_C_upper_Callback(hObject, eventdata, handles)
% hObject    handle to button_C_upper (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on key press with focus on figure1 or any of its controls.
function figure1_WindowKeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

switch eventdata.Key
  case 'a'
    button_C_Callback(handles.button_C,[],handles);
  case 's'
    button_D_Callback(handles.button_D,[],handles);
  case 'd'
    button_E_Callback(handles.button_E,[],handles);
  case 'f'
    button_F_Callback(handles.button_F,[],handles);
  case 'g'
    button_G_Callback(handles.button_G,[],handles);
  case 'h'
    button_A_Callback(handles.button_A,[],handles);
  case 'j'
    button_B_Callback(handles.button_B,[],handles);
  case 'k'
    button_C_upper_Callback(handles.button_C_upper,[],handles);
    
  case 'w'
    button_C_s_Callback(handles.button_C,[],handles);
  case 'e'
    button_D_s_Callback(handles.button_D,[],handles);
    
  case 't'
    button_F_s_Callback(handles.button_F,[],handles);
  case 'y'
    button_G_s_Callback(handles.button_G,[],handles);
  case 'u'
    button_A_s_Callback(handles.button_A,[],handles);
end





% --- Executes on button press in button_C_s.
function button_C_s_Callback(hObject, eventdata, handles)
% hObject    handle to button_C_s (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in button_D_s.
function button_D_s_Callback(hObject, eventdata, handles)
% hObject    handle to button_D_s (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in button_F_s.
function button_F_s_Callback(hObject, eventdata, handles)
% hObject    handle to button_F_s (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in button_G_s.
function button_G_s_Callback(hObject, eventdata, handles)
% hObject    handle to button_G_s (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in button_A_s.
function button_A_s_Callback(hObject, eventdata, handles)
% hObject    handle to button_A_s (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit_sample_Callback(hObject, eventdata, handles)
% hObject    handle to edit_sample (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_sample as text
%        str2double(get(hObject,'String')) returns contents of edit_sample as a double

input = get(hObject,'String');
handles.sample_name = input;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit_sample_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_sample (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_test_Callback(hObject, eventdata, handles)
% hObject    handle to edit_test (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_test as text
%        str2double(get(hObject,'String')) returns contents of edit_test as a double

input = get(hObject,'String');
handles.test_name = input;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit_test_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_test (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
