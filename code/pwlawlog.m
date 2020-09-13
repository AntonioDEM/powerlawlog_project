%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%                      \\\\////                         %    
%                       \\\///                          %     
%                        \\//                           %     
%                         \/                            %     
% ©Antonio Demarcus - 2019/2020                         %  
%    email : antonio.demarcus@gmail.com                 %  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%-------------------------------------------------------
% Esegue la procedura automatica per lo studio della
% distibuzione powerlawlog scritta da Aaron Clauset su 
% tutti i fogli di excell presenti nel file;
% stampa le tabelle nei formati .mat,.txt, .slx e li salva 
% nella carella Solution;
% stampa e salva i grafici nella cartella imgPl
%--------------Comandi utili-----------------------------
% digitare:
%close all: chiudere le finestre delle immagini
%clearvar:  elemina tutte le variabili dalla memoria
%clc:       cancella il command windows
%clear all per cancellare il workspace
%%-------------------------------------------------------

clc;clear all;

folderName= {'imgPL'};%% va sempre settata per ogni problema, linea 120 immagini
load('dataset_1.mat')

nelements = numel(S); %% numero elementi array 

% il foglio di excell potrebbe contenere dei fogli nascosti, è necessario 
% conoscere i nomi di questi fogli per escuderli.

sn = string(["Adattamento ad una distrib._HID",...
          "Adattamento ad una distrib._HI1",...
          "TUTTI","Modelling","Sheet37_HID","Sheet52",...
          "MODEL CONTROLLO TUTTI","MODEL REFRIGERATO TUTTI",...
          "TABELLA ANOVA","ANOVA_HID"]);% fogli da escludere

%%%----Elimina le cartelle che non servono----
S = S(~ismember(string({S.Name}), string(sn)));

SheetNames = {S.Name};

%%%-----seleziona solo le prime 4 colonne-----
for gg = 1:nelements
 S(gg).Data =  S(gg).Data(:,1:4);
end

%%----CellArray con DataValue+String - buffer data
for ii=1:nelements    
databuf{ii} = table2array(S(ii).Data);      
end

StringData2 = cellfun(@str2double,databuf,'UniformOutput',false);
%%% ---------Eliminazione dei NaN dalle celle -----------------------------

for ii = 1:1:nelements
databuf = StringData2{1,ii};
databuf(any(isnan(databuf),2),:) = [];
StringData2{1,ii} = databuf; % ricostruzione senza NaN
end


clear('jj','ii', 'sn');
save(fullfile('data_mat','dataset_2'),...
        'S','StringData2','nelements','SheetNames'); %salva i dati NaN
 
%%%----Calcolo Parametri lognormale e Power Law
clc; clear all;clearvars

load('dataset_2.mat')

Solution = zeros(nelements,12);
g1 = cell(1,numel(StringData2));
pd = cell(1,numel(StringData2));

for ii = 1:nelements
    
data1 = table2array(StringData2(:,ii));  

g = cat(1,StringData2{1,ii}(:,3));

g1{1,ii} = g;
  pd{1,ii} = fitdist(g,'Lognormal'); %% celling polifit
  mu = pd{1,ii}.mu;
  mubt = exp(pd{1,ii}.mu);
  sigma = pd{1,ii}.sigma;%%<===
  sigmabt = exp(sigma);
%f = figure('visible','off'); % calcola i parametri di g ma non visualizza i grafici

[alpha, xmin, D] = plfit(g,'finite'); 
%-- inserisce nella matrice le soluzione step by step
      Solution(ii,1)= alpha;
       Solution(ii,2)= xmin;
        Solution(ii,3)= D; 
        Solution(ii,4) = mu;
        Solution(ii,5)= sigma;
        Solution(ii,6)= mubt;
        Solution(ii,7)= sigmabt;
[a_err, xm_err, nt_err] = plvar(g,'silent');
      Solution(ii,8)= a_err;
       Solution(ii,9)= xm_err;
        Solution(ii,10)= nt_err; 
[p, gof] = plpva(g, xmin,'silent');
        Solution(ii,11)= p;
        Solution(ii,12)= gof;
end

%%%------Table of Solutions------------------------------------------------

%%% Crea una tabella con i nomi delle variabili

TabSol = array2table(Solution,'VariableNames',{'Apha','xmin','D',...
                                       'mu','sigma','mubt','sigmabt',...
                                       'a_err','xm_err','nt_err'...
                                       ,'p','gof'});


save(fullfile('Solution','Solution.mat'),'Solution','TabSol','SheetNames',...
                'g1','nelements')

soltxt = fullfile('Solution','TabSol.txt');
writetable(TabSol,soltxt);


%%%--------Salva xls---------------------------------------------

vars = {'c_dir','nprova','fname','range','soltxt','Prove','vars'};
vars{1} = cd; 
cd Solution;
vars{2} = 5; %% cambiare nel caso di file o prove diverse
vars{3} = [ 'TabSol' '_N' num2str(vars{2}) '.xls'];
vars{4} =['A1:M' num2str(nelements)];
writetable(TabSol,vars{3},'Sheet',1,'Range',vars{4});
clear vars;
cd ../;


%%%------------------------------------------------------------------------
clc; clear all; clearvars
%%%--------------------------Plot Solution---------------------------------

nota = {'Son presenti due tipi di plotaggio:'...
         'a) con la tabella dei valori formattati in LaTex'...
         'b) con la tabella dei valori non formattati'...
         'Se si vuole proseguire con la stampa e immagini'...
         'Premi 1 se vuoi plotsolLatex'...
         'Premi 2 se vuoi plotsolsimple'...
         'Premi 3 per annullare il plot'};

h = msgbox(nota);
set(h, 'position', [500 340 300 160]); %makes box bigger
ah = get( h, 'CurrentAxes' );
ch = get( ah, 'Children' );
set( ch,'Interpreter', 'latex', 'FontSize', 12 ); %makes text bigger
uiwait(h)

 n = input('Vuoi proseguire?    ')

switch n
    case 1
        disp('Avviato plotsolLaTex')
        plotsolLatex 
    case 2
        disp('Avviato plotsolsimple')
    case 3
        disp('Sei uscito dalla procedura di plot')
end


