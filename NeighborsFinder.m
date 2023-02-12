function [NeighPoints] = NeighborsFinder(Point,thetaMax)
%26 Neighboring points for each chosen point

x = Point(1);
y = Point(2);
t = Point(3);


NeighPoints = [[x+1,y,t];[x,y+1,t];[x-1,y,t];[x,y-1,t];[x+1,y+1,t];...
    [x-1,y-1,t];[x+1,y-1,t];[x-1,y+1,t]];
NeighPoints = [NeighPoints;[x,y,t+1];[x+1,y,t+1];[x,y+1,t+1];[x-1,y,t+1];[x,y-1,t+1];[x+1,y+1,t+1];...
    [x-1,y-1,t+1];[x+1,y-1,t+1];[x-1,y+1,t+1]];
NeighPoints = [NeighPoints;[x,y,t-1];[x+1,y,t-1];[x,y+1,t-1];[x-1,y,t-1];[x,y-1,t-1];[x+1,y+1,t-1];...
    [x-1,y-1,t-1];[x+1,y-1,t-1];[x-1,y+1,t-1]];

NeighPoints(NeighPoints(:,3)==0,3) = thetaMax;
NeighPoints(NeighPoints(:,3)==thetaMax+1,3) = 1;
NeighPoints(NeighPoints(:,1)==0) = [];
NeighPoints(NeighPoints(:,2)==0) = [];

NeighPoints = unique(NeighPoints,'rows');
NeighPoints(NeighPoints(:,1)==Point(1)&NeighPoints(:,2)==Point(2)&NeighPoints(:,3)==Point(3),:)=[];
end
