%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Envirment plotter for the given problem
% Inputs:
%        B_vert - Obsticals
%        Start  - Start node
%        Target - Target node
% Outputs:
%        f - env figure
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [f] = EnvPlotter2D(B_vert,Start,Target)
f = gcf;
ObsticalsPlot(B_vert);
hold on
plot(Start(1),Start(2),'p','MarkerFaceColor','red','MarkerEdgeColor','blue');
plot(Target(1),Target(2),'p','MarkerFaceColor','red','MarkerEdgeColor','blue');
text(Start(1)-1,Start(2)-1,'Start','color','r','fontsize',10,'fontweight','bold') ;
text(Target(1)-1,Target(2)-1,'Target','color','r','fontsize',10,'fontweight','bold') ;

text(5,20,'B1','color','b','fontsize',7,'fontweight','bold') ;
text(19,25,'B2','color','b','fontsize',7,'fontweight','bold') ;
text(27,20,'B3','color','b','fontsize',7,'fontweight','bold') ;
text(5,16,'B4','color','b','fontsize',7,'fontweight','bold') ;
text(27,16,'B5','color','b','fontsize',7,'fontweight','bold') ;
text(10,21,'B6','color','b','fontsize',7,'fontweight','bold') ;
text(23,21,'B7','color','b','fontsize',7,'fontweight','bold') ;
text(18,11,'B8','color','b','fontsize',7,'fontweight','bold') ;
text(15,31,'B0_1','color','b','fontsize',7,'fontweight','bold') ;
text(2,10,'B0_2','color','b','fontsize',7,'fontweight','bold') ;
text(15,2,'B0_3','color','b','fontsize',7,'fontweight','bold') ;
text(29,10,'B0_4','color','b','fontsize',7,'fontweight','bold') ;
end