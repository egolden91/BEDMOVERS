clear all
close all
clc
%% Load map
% load('mapMahmir.mat') 
load('map.mat') 
%% Navigation
% GridMap = I;
GridMap = GRID;
thetaMax = size(GridMap,3);
Start=[5,24,1];
Target=[5,8,1];
% [Path,Closed,status] = VeryBedMoverAstar(GridMap,Start,Target);
[Path,Closed,status] = VeryBedMoverAstarSimp(GridMap,Start,Target);
%% Plotting
HarryPlotter(B_vert,Start,Target,Path)

%% Live robot movment
Rob_vert = [-1/2 -1/2;1/2 -1/2;1/2 1/2;-1/2 1/2]; %SIMP
RoboMoveLive(Path,Rob_vert,thetaMax,B_vert,Start,Target)
%% Elippsises
DrawClosedNodes(Closed,Start,Target,Path,thetaMax)

%%