function varargout = orcGUI(varargin)
% orcGUI MATLAB code for orcGUI.fig
%      orcGUI, by itself, creates a new orcGUI or raises the existing
%      singleton*.
%
%      H = orcGUI returns the handle to a new orcGUI or the handle to
%      the existing singleton*.
%
%      orcGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in orcGUI.M with the given input arguments.
%
%      orcGUI('Property','Value',...) creates a new orcGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before orcGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to orcGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help orcGUI

% Last Modified by GUIDE v2.5 09-Nov-2017 17:39:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @orcGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @orcGUI_OutputFcn, ...
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


% --- Executes just before orcGUI is made visible.
function orcGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to orcGUI (see VARARGIN)

% Choose default command line output for orcGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes orcGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = orcGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inputs = getInputs(handles);
results = main(inputs.LPmin, inputs.LPmax, inputs.HPmin, inputs.HPmax);
printResults(handles, results);
% --------------------------------------------------------------------


function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function inputs = getInputs(handles)

inputs.LPmin = str2double(get(handles.LP_min_val, 'string'));
inputs.LPmax = str2double(get(handles.LP_max_val, 'string'));
inputs.HPmin = str2double(get(handles.HP_min_val, 'string'));
inputs.HPmax = str2double(get(handles.HP_max_val, 'string'));
inputs.Margin_tank = str2double(get(handles.Margin_tank_val, 'string'));

function printResults = printResults(handles,results)

set(handles.LP_opt_val,'string',strcat(num2str(results.LP),' bars'));
set(handles.HP_opt_val,'string',strcat(num2str(results.HP),' bars'));
set(handles.Tsat_LP_val,'string',strcat(num2str(results.Tsat_LP), ' °C'));
set(handles.Tsat_HP_val,'string',strcat(num2str(results.T3), ' °C'));
set(handles.LT_val,'string',strcat(num2str(results.LT), ' °C'));
set(handles.HT_val,'string',strcat(num2str(results.T3), ' °C'));

set(handles.x4_opt_val,'string',num2str(results.x4));
set(handles.Wp_opt_val,'string',strcat(num2str(results.Wp_in), ' kJ/kg'));
set(handles.Qe_opt_val,'string',strcat(num2str(results.Qe_in), ' kJ/kg'));
set(handles.Wt_opt_val,'string',strcat(num2str(results.Wt_out), ' kJ/kg'));
set(handles.Qc_opt_val,'string',strcat(num2str(results.Qc_out), ' kJ/kg'));
set(handles.Wnet_val,'string',strcat(num2str(results.Wnet), ' kJ/kg'));
set(handles.Eff_opt_val,'string',strcat(num2str(results.Eff),' %'));
set(handles.Fluid_opt_val,'string',num2str(results.Fluid));
evap = evaporator(results.T3,results.LT);
cond = condenser(results.T3,results.LT);
set(handles.Pevaporator_val,'string',strcat(num2str(roundn(evap.Pechangee,-1)), ' kW'));
set(handles.Pcondenser_val,'string',strcat(num2str(roundn(cond.Pechangee,-1)), ' kW'));


function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function HP_min_val_Callback(hObject, eventdata, handles)
% hObject    handle to HP_min_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HP_min_val as text
%        str2double(get(hObject,'String')) returns contents of HP_min_val as a double


% --- Executes during object creation, after setting all properties.
function HP_min_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HP_min_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to HP_min_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HP_min_val as text
%        str2double(get(hObject,'String')) returns contents of HP_min_val as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HP_min_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LP_min_val_Callback(hObject, eventdata, handles)
% hObject    handle to LP_min_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LP_min_val as text
%        str2double(get(hObject,'String')) returns contents of LP_min_val as a double


% --- Executes during object creation, after setting all properties.
function LP_min_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LP_min_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function HP_max_val_Callback(hObject, eventdata, handles)
% hObject    handle to HP_max_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HP_max_val as text
%        str2double(get(hObject,'String')) returns contents of HP_max_val as a double


% --- Executes during object creation, after setting all properties.
function HP_max_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HP_max_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LP_max_val_Callback(hObject, eventdata, handles)
% hObject    handle to LP_max_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LP_max_val as text
%        str2double(get(hObject,'String')) returns contents of LP_max_val as a double


% --- Executes during object creation, after setting all properties.
function LP_max_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LP_max_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function T3_factor_Callback(hObject, eventdata, handles)
% hObject    handle to T3_factor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of T3_factor as text
%        str2double(get(hObject,'String')) returns contents of T3_factor as a double


% --- Executes during object creation, after setting all properties.
function T3_factor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to T3_factor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Margin_tank_val_Callback(hObject, eventdata, handles)
% hObject    handle to Margin_tank_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Margin_tank_val as text
%        str2double(get(hObject,'String')) returns contents of Margin_tank_val as a double


% --- Executes during object creation, after setting all properties.
function Margin_tank_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Margin_tank_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function kWh_val_Callback(hObject, eventdata, handles)
% hObject    handle to kWh_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kWh_val as text
%        str2double(get(hObject,'String')) returns contents of kWh_val as a double


% --- Executes during object creation, after setting all properties.
function kWh_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kWh_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Elec_power_val_Callback(hObject, eventdata, handles)
% hObject    handle to Elec_power_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Elec_power_val as text
%        str2double(get(hObject,'String')) returns contents of Elec_power_val as a double


% --- Executes during object creation, after setting all properties.
function Elec_power_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Elec_power_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
