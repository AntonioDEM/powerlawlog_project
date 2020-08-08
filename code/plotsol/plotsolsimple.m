%--------Simple - plot ---------------------  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%                                                       %
%                      ________                         % 
%                      \\     /                         %    
%                       \\   /                          %     
%                        \\ /                           %     
%                         \/                            %     
%	©Antonio Demarcus - 2019/2020                       %	 
%    email : antonio.demarcus@gmail.com             	%	 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear all;

% Number of digits to the right of the decimal point
% Example: '%.4f' prints pi as '3.1416'
% Number of significant digits
% Example: '%.4g' prints pi as '3.142'

load('Solution.mat')
folderName= {'imgPL'};

% %%----------POWERLOW CORRETTO--------------------------

 for ii = 1:nelements
 titolo  = SheetNames{1,ii};    
  plplot(g1{1,ii},Solution(ii,2),Solution(ii,1)); 
 
 valalfa = num2str(Solution(ii,1),'%.3f');
 valalfa2 = num2str(Solution(ii,1),'%.3f');
 valxmin = num2str(Solution(ii,2),'%.3f');
 valD = num2str(Solution(ii,3),'%.3f');
 valmu= num2str(Solution(ii,4),'%.3f');
 valsigma = num2str(Solution(ii,5),'%.3f');
 valmubt= num2str(Solution(ii,6),'%.3f');
 valsigmabt = num2str(Solution(ii,7),'%.3f');
 
 legend_str{1} =  ['alpha = ' valalfa];legend_str{2} = ['xmin = ' valxmin];
 legend_str{3} = ['D = ' valD];
 legend_str{4} = ['mu = ' valmu]; legend_str{5} = ['mubt = ' valmubt];
 legend_str{6} = ['sigma = ', valsigma]; legend_str{7} = ['sigmabt = ', valsigmabt];
 
 labels = {'$$\alpha$$', '$$x_{min}$$', '$$\mu$$'};
  annotation('textbox',...
  [0.15 0.29 0.18 0.19],...
  'Interpreter', 'latex',...
   'String',{['$$\alpha\;=\;$$' valalfa],'',['$$x_{min}\;=\;$$' valxmin],...
            '',['$$D \;=\; $$' valD]},...
  'LineStyle','none',...
  'FontSize',12,...
  'FontName','Arial',...
  'FitBoxToText','off');

 annotation('textbox',...
  [0.32 0.23 0.20 0.25],...
  'Interpreter', 'latex',...
   'String',{['$$\mu \;=\; $$' valmu],'',['$$\sigma \;=\; $$', valsigma],'',...
             ['$$\mu_{bt} \;=\; $$' valmubt],'',['$$\sigma_{bt} \;=\;$$',...
              valsigmabt]},...
  'LineStyle','none',...
  'FontSize',12,...
  'FontName','Arial',...
  'FitBoxToText','off');

 title(titolo)
 baseFileName = sprintf('%d-imgplpva', ii); % e.g. "1.png"
 fullFileName = fullfile(folderName{:,1}, baseFileName);
 export_fig(fullFileName)   
end
%close all %% per non vedere tutti grafici a schermo