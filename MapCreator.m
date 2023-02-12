%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  MAP CREATOR script
%  Same as part 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%robot
% Rob_vert = [0,0; 1,0 ; 1,1 ; 0,1];
% Rob_vert = [-3/4,-3/4; -3/4,3/4 ; 3/4,3/4 ; 3/4,-3/4];
% Rob_vert = [0,0; 0.1,0 ; 0.1,0.1 ; 0,0.1];
% Rob_vert = [-1/2,-1/2; -1/2,1/2 ; 1/2,1/2 ; 1/2,-1/2];
% Rob_vert = [0,0; 0,1 ; 8,1 ; 8,0];
Rob_vert = [0 0;8 0;8 1;0 1];
% LL,LR,UR,UL
%outer walls
BO_vert{1} = [0,29; 32,29; 32,30; 0,30];
BO_vert{2} = [0,1; 1,1; 1,29; 0,29];
BO_vert{3} = [0,0; 32,0; 32,1; 0,1];
BO_vert{4} = [31,1; 32,1; 32,29; 31,29];

%inner walls
B_Obs_vert{1} = [0,18; 10,18; 10,19; 0,19];
B_Obs_vert{2} = [17,17; 18,17; 18,29; 17,29];
B_Obs_vert{3} = [25,18; 32,18; 32,19; 25,19];
B_Obs_vert{4} = [0,14; 19,14; 19,15; 0,15];
B_Obs_vert{5} = [24,13; 32,13; 32,15; 24,15];
B_Obs_vert{6} = [10,19; 12,19; 12,20; 10,20];
B_Obs_vert{7} = [23,19 ; 25,19; 25,20; 23,20];
B_Obs_vert{8} = [18,12 ; 19,12; 19,14; 18,14];

B_vert = [BO_vert , B_Obs_vert];
n_layers = 51;
[COBSpoly,ROBpoly_Rot,OBSpoly,theta_v]=c_obstacle_layers(Rob_vert,B_vert,n_layers);
proj_visual1(COBSpoly,ROBpoly_Rot,OBSpoly)
[I,X,Y] = obs_grid(COBSpoly,32,32);
% surf(X,Y,I(:,:,1))
% save('mapSimp.mat','I','Rob_vert','B_vert')
save('map2.mat','I','Rob_vert','B_vert')

