function [Fig]=proj_visual1(COBSpoly,ROBpoly_Rot,OBSpoly)
% creating figure with four subplots matching  four slices of theta 
% requierd mini proj #1 
Fig=figure;
% requierd theta angles
layers_out = [1 10 32 40];
% create plot for each slice
for k=1:length(OBSpoly)
    dispName{k,:} = ['Obs #',num2str(k)];
end
for k=1:length(layers_out)
    layer_n = layers_out(k);
    subplot(2,2,k)
    pl1 = plot(OBSpoly); hold on;
%     set(pl1,{'DisplayName'},dispName)
    pl2 = plot(ROBpoly_Rot(layer_n),'DisplayName','Robot'); 
    pl3 = plot(COBSpoly(layer_n),'DisplayName','c-Obstacle'); axis equal;
    title(['layer ',num2str(layer_n)]);
    legend([pl2,pl3],{'Robot','c-Obstacle'});
    grid
end
end