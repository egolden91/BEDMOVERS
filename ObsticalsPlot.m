%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ObsticalsPlot - 2d obstical plotter
% Inputs:
%        Obs - given obsticals cell array same as part 1
% Outputs:
%        nan
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [] = ObsticalsPlot(Obs)
for ii = 1:length(Obs)
    fill(Obs{ii}(:,1) , Obs{ii}(:,2) , 'k') ;
    hold on ;
end
grid minor ;
end