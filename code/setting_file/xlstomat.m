%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%                      \\\\////                         %    
%                       \\\///                          %     
%                        \\//                           %     
%                         \/                            %     
% ©Antonio Demarcus - 2019/2020                         %  
%    email : antonio.demarcus@gmail.com                 %  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%-------------------------------------------------------
% Converte un file .xls in file .mat e lo salva in una 
% directory specifica.
% 
%%-------------------------------------------------------
clc;clear all

 
folder = {'data_xls'};
dataset{1} = 'dataset_1.mat';
Data = cell(100,1); SheetNames =[] ;
Data= cell(numel(folder),1);
 
for fo = 1:numel(folder)
    files = dir(folder{fo}); 
    files([files(:).isdir]) = []; 
    Data{fo} = cell(numel(files),1);
    for fi = 1:numel(files)
        filename = fullfile(folder{fo},files(fi).name);
        disp(filename)
        [status,SheetNames] = xlsfinfo(filename);
        
%%-------------------------------------------------
        nSheets = length(SheetNames);
        Name = cell(fi,nSheets);
%%-------------------------------------------------        
        if ~isempty(status)
            lastsheet = SheetNames{end};
%%-------------------------------------------------
        end
    end
end

%%-------------Crea Struttura-----------------------
for iSheet = 1:nSheets

  Name = SheetNames{iSheet}; 
  Data = readtable(filename,'Sheet',Name,'ReadVariableNames',false) ; 
  S(iSheet).Name = Name;
  
  S(iSheet).Data = Data;
  
end
%%-------------------------------------------------

%%---- Salva i dati in una cartella specifica -----------------

save(fullfile('data_mat',dataset{1}),...
        'S','iSheet','nSheets','SheetNames');

%%-----fine tempo esecuzione in secondi--------
 