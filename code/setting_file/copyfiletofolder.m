function copyfiletofolder
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Sposta un file .xls  dalla directory selezionata ad   %
% un altra directory.                           		% 
%                      \\\\////                         %    
%                       \\\///                          %     
%                        \\//                           %     
%                         \/                            %     
%	©Antonio Demarcus - 2019/2020                       %	 
%    email : antonio.demarcus@gmail.com             	%	 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

persistent lastPath path
% se è la prima che si esegue la funzione in questa sessione,
% inizializza lastPath su 0
listaest = {'*.xls';'*.m';'*.mat';'*.txt';'*.csv';'*.*'};
sz = get( 0, 'Screensize');
CStruct.Interpreter = 'tex';
CStruct.WindowStyle = 'modal';
CStruct.FontSize = 12;
nota1 = ['\fontsize{8} \rm Seleziona la cartella e il nome del file'];
nota2 = ['\fontsize{8} \rm Seleziona la cartella di destinazione'];

if isempty(lastPath) 
    lastPath = 0;
end

h=msgbox(nota1,'Selection','help',CStruct);
uiwait(h);

if lastPath == 0
    [fileNames,path] = uigetfile(listaest,...
                          'File Selector');
if isequal(fileNames,0)
   disp('User ha selezionato cancella');
else
   disp(['User ha selezionato ', fullfile(path,fileNames)]);
end
% All subsequent calls, use the path to the last selected file
else
    [fileNames, path] = uigetfile(lastPath);
end
% Utilizza il percorso dell'ultimo file selezionato
% Se viene chiamato "uigetfile", ma nessun elemento è selezionato,
% "lastPath" non viene sovrascritto con 0
if path ~= 0
    lastPath = path;
end   
 iFiles.name = fileNames;
 iFiles.dirin   = path;
 fileNames = cellstr(fileNames);

h=msgbox(nota2,'Selection',CStruct);
uiwait(h)

for k = 1 : length(iFiles)
  FileName = fileNames{k};
  % Prepara l'input del file.
  FN_in = fullfile(path, FileName);
  % Prepara l'output del file

  [FN_out,iFiles.dirout] = uiputfile(listaest,'Seleziona File');
if isequal(FN_out,0) || isequal(iFiles.dirout,0)
   disp('User ha annullato.')
else
   disp(['User rinominato e salvato il file in ',...
       fullfile(iFiles.dirout,FN_out)])
end
  FN_out = fullfile(iFiles.dirout, FN_out);
  copyfile(FN_in, FN_out);
end
end