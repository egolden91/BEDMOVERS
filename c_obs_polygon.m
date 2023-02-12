function [COBSpoly] = c_obs_polygon(OBSpoly,ROBpoly)
% Input
% OBSpoly - Obstacel polyshape
% ROBpoly - Robot polyshape
% Output
% COBSpoly - C-Obstacle polyshape

% find robot and obstacle polygons normals
obs_vert = OBSpoly.Vertices;
obs_normals = zeros([length(obs_vert),2]); %intialize
for k=1:length(obs_vert)
    k1 = k; % current vert
    k2 = mod(k,length(obs_vert))+1; % next-in-order vert
    %Create array of normal vectors
    obs_normals(k,:) = edge_normal_ccw(OBSpoly.Vertices(k1,:),...
        OBSpoly.Vertices(k2,:)); 
end
robot_vert = ROBpoly.Vertices;
robot_normals = zeros([length(obs_vert),2]); %intialize
for k=1:length(robot_vert)
    k1 = k; % current vert
    k2 = mod(k,length(robot_vert))+1; % next-in-order vert
    robot_normals(k,:) = edge_normal_ccw(ROBpoly.Vertices(k1,:),...
        ROBpoly.Vertices(k2,:));
end

% creating c-obstacle vertices for each theta section
common_sec_ind = overlap_sector(robot_normals,obs_normals) ;
c_obs_vert = obs_vert(common_sec_ind(:,2),:)-...
    robot_vert(common_sec_ind(:,1),:);
COBSpoly = polyshape(c_obs_vert(:,1'),c_obs_vert(:,2'));
end