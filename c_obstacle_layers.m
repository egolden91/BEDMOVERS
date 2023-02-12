function [CB,A_Rot,B,theta_v]=c_obstacle_layers(A_vert,B_vert,n_layers)
% build 32 layers of fixed theta slices of the c-obstacle CB due to a
% convex polygonal robot A intersecting a convex polygonal obstacle B
% Input:
%   A_vert - convex polygonal robot vertices
%   B_vert - convex polygonal obstacle vertices for multiple obstacles this
%   should be a cell array
% Output:
%   CB - 32 fixed-theta layers c-obstacle
%   A_Rot - 32 theta rotated polyshape robot
%   B - polyshape obstacle B
%   theta_v = 32 regularly spaced theta angles from 0 to 360-360/32
%   degrees.

% Definig theta according to Q1 in mini-proj #1
% n_layers =1;
theta_v= linspace(0,360-360/n_layers,n_layers);

% Polyshapes intialization
CB(1:n_layers) = polyshape([0,0]); % c-obstacle
A_Rot(1:n_layers) = polyshape([0,0]); % robot A rotated

A = polyshape(A_vert(:,1'),A_vert(:,2'));
if ~iscell(B_vert) % single obstacle vertices
    B = polyshape(B_vert(:,1'),B_vert(:,2'));
    for k1=1:n_layers
        theta_deg = theta_v(k1); % current orientaion angle
        A_Rot(k1) = rotate(A,theta_deg,[0,0]); % robot rotation
        [CB(k1)] = c_obs_polygon(B,A_Rot(k1)); % calculate current c-obstacle polygon
    end
else % multiple obstacle vertices given in cell array
    n_obstacles = length(B_vert);
    B = polyshape([0,0]);
    for k1=1:n_layers
        theta_deg = theta_v(k1); % current orientaion angle
        A_Rot(k1) = rotate(A,theta_deg,[0,0]); % robot rotation
        for k2=1:n_obstacles % % calculate current c-obstacle polygon for n_obstacles
            B_temp = polyshape(B_vert{k2}(:,1'),B_vert{k2}(:,2')); % current obstacle
            B(k2) = B_temp;
            CB_temp = c_obs_polygon(B_temp,A_Rot(k1)); % current c-obstacle
            CB(k1) = union(CB(k1),CB_temp); % uniting all c-obstacles so far
        end

    end
end
end