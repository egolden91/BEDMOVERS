function [normal_vect] = edge_normal_ccw(vert1,vert2)
% edge_normal_ccw finds the normal vector of the line connecting between 2
% vertices: vert1 vert2 of a convex polynomial. 
% the vertices are given in ccw order
%   vert1 vert2: [x1,y1] [x2,y2] format vertices
line_vect = vert2-vert1;
normal_vect = [line_vect(2),-line_vect(1)]/norm(line_vect);
end