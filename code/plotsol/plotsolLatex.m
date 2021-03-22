
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%           --------Table LaTex Plot --------           %
%                      ________                         % 
%                      \\     /                         %    
%                       \\   /                          %     
%                        \\ /                           %     
%                         \/                            %     
%	�Antonio Demarcus - 2019/2020                       %	 
%    email : antonio.demarcus@gmail.com             	%	 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; clear all;
%%%-- per inserire nei grafici le tabelle delle soluzioni utilizza lo script
%%%latexTable inserito nella cartella script.

load('Solution.mat')
%nn = length(Solution);
nn = size(Solution);
nn = nn(1);
latex = cell(1,nn); latex2=cell(1,nn); tabdata = cell(1,nn);
folderName= {'imgPL'};
Solution(:,6) = NaN; % le colonne devono essere sempre uguali, saranno 3 per la PWL e 3 per la LN

for ii= 1:nn
input.data = Solution(ii,1:3);
%input.tableColLabels = {'alpha', 'xmin', 'D','mu','sigma'}; %% primo
%metodo tutto in linea
input.tableColLabels = {'$$\alpha$$', '$$x_{min}$$', '$$D$$'};%% tre colonne
input.tableRowLabels = {'PowerLow'}; % row labels 
input.transposeTable = 0;
input.dataFormatMode = 'column';
%input.dataFormat = {'%.2f',2,'%.2f',1,};
input.dataFormat = {'%.2f',3};

% Define how NaN values in input.tableData should be printed in the LaTex table:
input.dataNanString = '-';

% Column alignment in Latex table ('l'=left-justified, 'c'=centered,'r'=right-justified):
input.tableColumnAlignment = 'c';

input.tableBorders = 1;

input.makeCompleteLatexDocument = 1;

% call latexTable:
latex{:,ii} = latexTable(input);
end

for ii= 1: nn 
input2.data = Solution(ii,4:6);
%input.tableColLabels = {'alpha', 'xmin', 'D','mu','sigma'}; %% primo
%metodo tutto in linea
input2.tableColLabels = {'$$\mu$$', '$$\sigma$$',' '};%% tre colonne
input2.tableRowLabels = {'LogNorm'}; % row labels 
input2.transposeTable = 0;
input2.dataFormatMode = 'column';
%input.dataFormat = {'%.2f',2,'%.2f',1,};
input2.dataFormat = {'%.2f',3};

% Define how NaN values in input.tableData should be printed in the LaTex table:
input2.dataNanString = '-';

% Column alignment in Latex table ('l'=left-justified, 'c'=centered,'r'=right-justified):
input2.tableColumnAlignment = 'c';

input2.tableBorders = 1;

input2.makeCompleteLatexDocument = 1;

% call latexTable:
latex2{:,ii} = latexTable(input2);
end
%ccs = latex{1,2}(5:11,1);

for ii = 1:nn
plw = latex{1,ii}(5:9,1) ;%%% prende i dati della PoweLaw Function
%plw2(1:5,ii)= plw(1:5,1); %% verifica  e scelta posizione
ln = latex2{1,ii}(6:11,1) ;%%% prende i dati della LogNorm Function
%ln2(1:6,ii)= ln(1:6,1); %% verifica  e scelta posizione


tabdata(1,ii) = strcat(plw{1,1},{' '},plw{2,1},{' '},plw{3,1},...
             {' '},plw{4,1},{' '},plw{5,1},...
      {' '},ln{1,1}, {' '},ln{2,1},{' '},ln{3,1},...
      {' '},ln{4,1},{' '},ln{5,1},{' '},ln{6,1});
end

%%----------POWERLOW CORRETTO--------------------------

 for ii = 1:nn
 titolo  = SheetNames{1,ii};    
  
 plplot(g1{1,ii},Solution(ii,2),Solution(ii,1)); 

 ha = annotation('textbox',[0.13 0.25 0.1531 0.082], 'Interpreter', 'latex','FitBoxToText','off',...
    'EdgeColor',[1 1 1]);
set(ha, 'String', tabdata(1,ii));

 title(titolo)
 baseFileName = sprintf('%d-imgplpva', ii); % e.g. "1.png"
 fullFileName = fullfile(folderName{:,1}, baseFileName);
 export_fig(fullFileName, '-nocrop')   
 end
 close all;