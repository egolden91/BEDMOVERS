function [] = DrawClosedNodes(CLOSED,Start,Target,Path,thetaMax)
track = 0;
for k = 2:max(size(Path))
    track = CostFunction([Path(k-1, 1), Path(k-1,2), Path(k-1,3)], [Path(k,1), Path(k,2), Path(k,3)] , thetaMax)+ track;
end
figure
plot3(CLOSED(:,1),CLOSED(:,2),CLOSED(:,3),'.') ;
hold on ;
f1 = @(x,y,z) sqrt((x-Start(1))^2+(y-Start(2))^2 +(z-Start(3))^2 )+sqrt((x-Target(1))^2+(y-Target(2))^2 + (z-Target(3))^2)- track; %first elipsis
f2 = @(x,y,z) sqrt((x-Start(1))^2+(y-Start(2))^2 +(z-Start(3)-thetaMax)^2 )+sqrt((x-Target(1))^2+(y-Target(2))^2 + (z-Target(3)-thetaMax)^2)- track;
fimplicit3(f1,'EdgeColor',[0 .5 0],'FaceAlpha',.01)
hold on
fimplicit3(f2,'EdgeColor',[0 .5 0],'FaceAlpha',.01)
axis([-50 50 -40 50 -30 80])
grid minor
title('Closed Nodes')% & Ellipsoid in 3D','fontsize',18,'fontweight','bold') ;
xlabel('X','fontsize',14,'fontweight','bold') ;
ylabel('Y','fontsize',14,'fontweight','bold') ;
zlabel('\theta','fontsize',14,'fontweight','bold') ;


end
