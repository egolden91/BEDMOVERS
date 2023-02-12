function [] = RoboMoveLive(Path, Rob_vert, thetaMax,B_vert,Start,Target)

[f] = EnvPlotter2D(B_vert,Start,Target);
fill(Rob_vert(:,1)+Path(1,1),Rob_vert(:,2)+Path(1,2),'c');
hold on;

n = size(Path,1);
Pos = [Rob_vert(:,1),Rob_vert(:,2)]';
for k = 2:n-1
    theta = (Path(k,3)-1)*2*pi/thetaMax; %rad
    rot = [cos(theta) -sin(theta) ; sin(theta) cos(theta)] ;
    p = [Path(k,1)-1; Path(k,2)-1] ;       %translation vector
%     p = [Path(k,1)-1; Path(k,2)-1] ;       %translation vector
    T = [rot p ; 0 0 1] ;                  %transformation matrix
    NewPos = T*[Pos;ones(1,4)] ;           %new position
    fill(NewPos(1,:), NewPos(2,:),'c','edgecolor','black','FaceAlpha',0.1) ;
    pause(0.1);
end

fill(Rob_vert(:,1)+Path(end,1),Rob_vert(:,2)+Path(end,2),'c');
fill(Rob_vert(:,1)+Path(1,1),Rob_vert(:,2)+Path(1,2),'c');
xlabel('x','fontsize',14,'fontweight','bold') ;
ylabel('y','fontsize',14,'fontweight','bold') ;
end