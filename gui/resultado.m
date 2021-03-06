function varargout = resultado(varargin)
% RESULTADO MATLAB code for resultado.fig
%      RESULTADO, by itself, creates a new RESULTADO or raises the existing
%      singleton*.
%
%      H = RESULTADO returns the handle to a new RESULTADO or the handle to
%      the existing singleton*.
%
%      RESULTADO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RESULTADO.M with the given input arguments.
%
%      RESULTADO('Property','Value',...) creates a new RESULTADO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before resultado_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to resultado_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help resultado

% Last Modified by GUIDE v2.5 29-Aug-2016 10:47:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @resultado_OpeningFcn, ...
                   'gui_OutputFcn',  @resultado_OutputFcn, ...
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


% --- Executes just before resultado is made visible.
function resultado_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to resultado (see VARARGIN)

% Choose default command line output for resultado
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes resultado wait for user response (see UIRESUME)
% uiwait(handles.figure1);
text='Informe de la Simulación';
 line='----------------------------------------------------';
set(handles.resultat,'String',[text;{line}]);
oldtext=get(handles.resultat,'String');
text=['Fecha: ' num2str(date)];
set(handles.resultat,'String',[oldtext;{text}]);
fid = fopen('archivo.txt');

tline = fgetl(fid);
while ischar(tline)
    tline = fgetl(fid);
    if tline ~= -1
    oldtline=get(handles.resultat,'String');
    set(handles.resultat,'String',[oldtline;{tline}]);
    end
end

fclose(fid);

% --- Outputs from this function are returned to the command line.
function varargout = resultado_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when entered data in editable cell(s) in uitable1.
function uitable1_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function resultat_CreateFcn(hObject, eventdata, handles)
% hObject    handle to resultat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
