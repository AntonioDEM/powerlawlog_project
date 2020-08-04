clc;clear all
%%--usare se non ? impostata la path delle cartelle --

% load('pathfolder.mat')%% --load path file folder
% addpath(pathfolder)
%clear('pathfolder');clc
%%-----------------------------------------------------
tStart = tic;

Data = cell(100,1); SheetName =[] ;
folders = {'data_xls'};
fname{1} = 'dataset_1.mat';
Data= cell(numel(folders),1);
 
for fo = 1:numel(folders)
    files = dir(folders{fo}); 
    files([files(:).isdir]) = []; 
    Data{fo} = cell(numel(files),1);
    for fi = 1:numel(files)
        filename = fullfile(folders{fo},files(fi).name);
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

%%-------------------------------------------------
for iSheet = 1:nSheets

  Name = SheetNames{iSheet}; 
  Data = readtable(filename,'Sheet',Name,'ReadVariableNames',false) ; 
  S(iSheet).Name = Name;
  
  S(iSheet).Data = Data;
end
%%-------------------------------------------------

%%--Save data in specific folder -----------------

save(fullfile('data_mat',fname{1}),...
        'S','iSheet','nSheets','SheetNames');
      
 tEnd = toc(tStart);
 fprintf('%d minutes and %f seconds\n', floor(tEnd/60), rem(tEnd,60));
