function [I,X,Y] = obs_grid(CB,n,m)
% creates the grid requierd in Q3 mini proj#1
% Inputs:
%   CB - c-obstacle given in polyshape
%   n - number of grid rows
%   m - number of grid columns
% Output:
%   I - nXmXl binary matrix
% 
l = length(CB);
% x=linspace(0,32,m+1);
% y=linspace(0,30,n+1);
x=linspace(0,32,m);
y=linspace(0,30,n);
dx = mean(diff(x));
dy = mean(diff(y));
[X,Y]=meshgrid(x,y);

I = zeros([length(x),length(y),l]);

for kt=1:l
    for kx=1:(length(x)-1)
        for ky=1:(length(y)-1)
            I_temp = isinterior(CB(kt),x(kx)+dx/2,y(ky)+dy/2);
            I(kx,ky,kt)=I_temp;
        end
    end
end
end