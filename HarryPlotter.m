function [] = HarryPlotter(B_vert,Start,Target,Path)


figure(1)
EnvPlotter2D(B_vert,Start,Target);
plot3(Path(:,1),Path(:,2),Path(:,3),'-rx','MarkerSize',5,'LineWidth',2);
grid on; title('3D plot'); 
xlabel('X'); ylabel('Y'); zlabel('\theta')
hold on;
plot3(Path(:,1),Path(:,2),Path(:,3),'b','LineWidth',2);

% figure(2)
% EnvPlotter2D(B_vert,Start,Target);
% plot(Path(:,1),Path(:,2),'-rx','MarkerSize',5,'LineWidth',2);
% grid on; title('XY plot'); 
% xlabel('X'); ylabel('Y'); 
% hold on;
% plot(Path(:,1),Path(:,2),'b','LineWidth',2);
% 
% 
% figure(3)
% EnvPlotter2D(B_vert,Start,Target);
% plot(Path(:,1),Path(:,3),'-rx','MarkerSize',5,'LineWidth',2);
% grid on; title('X\theta plot'); 
% xlabel('X'); ylabel('\theta'); 
% hold on;
% plot(Path(:,1),Path(:,3),'b','LineWidth',2);
% 
% 
% figure(4)
% EnvPlotter2D(B_vert,Start,Target);
% plot(Path(:,2),Path(:,3),'-rx','MarkerSize',5,'LineWidth',2);
% grid on; title('Y\theta plot'); 
% xlabel('Y'); ylabel('\theta'); 
% hold on;
% plot(Path(:,2),Path(:,3),'b','LineWidth',2);


end