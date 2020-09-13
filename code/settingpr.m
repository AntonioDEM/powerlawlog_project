%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% setting project                                       %
%                      ________                         % 
%                      \\     /                         %    
%                       \\   /                          %     
%                        \\ /                           %     
%                         \/                            %     
%	©Antonio Demarcus - 2019/2020                       %	 
%    email : antonio.demarcus@gmail.com             	%	 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%-------------------------------------------------------
% Crea le cartelle necessarie al progetto
% Salva le cartelle di path del progetto
% Sposta il file da elabolare nella cartella data_mat
% xlstomat: converte il file .xls in .mat
%--------------Comandi utili-----------------------------
% digitare:
% close all  per chiudere le finestre
%clearvar per eleminare tutte le variabili dalla memoria
%clc per cancellare il command windows
%clear all per cancellare il workspace
%%-----------------------------------------------------


clc; clear all; clearvars;
tStart = tic;
% nfold = 'C:\Users\Tony\Documents';
% folder = uigetdir(nfold);

sz = get( 0, 'Screensize');
CStruct.Interpreter = 'tex';
CStruct.WindowStyle = 'modal';
CStruct.FontSize = 12;
nota1 = ['\fontsize{10} \rm Seleziona la cartella path'];
nota2 = ['\fontsize{10} \rm Copiare il file di dati in formato xls nella cartella "data_xls", digitare "1" e invio, altrimenti se presente, digitare "2" e invio'];

nota3 = ['\fontsize{10} \rm Avvia il file xlstomat per convertire il file xls'];

h=msgbox(nota1,'Selection','help',CStruct);
uiwait(h)

%-- seleziona la cartella che diventerèa la path del prgetto
folder = uigetdir();
textLabel = sprintf('la path del progetto è: %s', folder);

%--Crea le cartelle necessarie per il progetto
newfold= {'data_xls','data_mat','imgPL','Solution'}; %% Folder Root Name
maxf = length(newfold);
for n = 1:maxf
    mkdir([newfold{1,n}])
    n+1;
end

%salva la path
addpath(genpath(folder));
disp([textLabel])
savepath;

%------scecgliere la cartella da cui prendere il file xls e copiarla
%nella cartella data_mat

h=msgbox(nota2,'Selection','help',CStruct);
uiwait(h)

n = input('Vuoi copiare il file xls nella cartella data_mat?  ')

switch n
    case 1
        disp('Avvia procedura')
        copyfiletofolder 
    case 2
        disp('Esci dalla procedura')
end

h=msgbox(nota3,'Selection','help',CStruct);
uiwait(h)

n = input('Vuoi convertire il file .xls in file .mat?  ')

switch n
    case 1
        disp('Avvia procedura di conversione!!')
        xlstomat
    case 2
        disp('Esci dalla procedura')
end

clearvars;
