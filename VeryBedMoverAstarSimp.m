function [Path,CLOSED,successFlag] = VeryBedMoverAstar(GridMap,Start,Target)
% ASTAR
thetaMax = size(GridMap,3);
h = @(x,y,t)CostFunction(x,y,t);   %heuristics function
OPEN   = [];
% FROM   = zeros([size(GridMap),3]);
CLOSED = [];
Dist = zeros(size(GridMap));
OPEN = [OPEN;Start,h(Start,Target,thetaMax)];
successFlag = false;


itr = 1;
while ~isempty(OPEN)
    Xbest = OPEN(1,:);          %take  Xbest
    CLOSED(itr,:) = Xbest;      %close  Xbest
    OPEN(1,:) = [];             %remove Xbest from OPEN
    if all(Xbest(1:3)==Target)  %check if Xbest is the target
        disp('Path found!')
        successFlag = true;
        break
    end
    Neigbors = NeighborsFinder(Xbest(1:3),thetaMax); %find all neighbors
    for ii = 1:size(Neigbors,1)
        if GridMap(Neigbors(ii,1),Neigbors(ii,2),Neigbors(ii,3))  %check if the neighbor is a free point if not skip it
            continue
        end
        if  ~ismember(Neigbors(ii,:),CLOSED(:,1:3),'rows') %check if neighbor is already visited
%             NeigbCost = Dist(Xbest(1),Xbest(2),Xbest(3)) + h(Xbest(1:3),Neigbors(ii,:),thetaMax)+ h(Neigbors(ii,:),Target,thetaMax);
            NeigbCost = h(Neigbors(ii,:),Target,thetaMax);
            [inOpen,locOpen] = ismember(Neigbors(ii,:),OPEN(:,1:3),'rows'); %check if neighbor is already in open
            if inOpen %already in OPEN
                OPEN(locOpen,4) = min(OPEN(locOpen,4),NeigbCost);
                if OPEN(locOpen,4)==NeigbCost %if cost is updated, update dist and parent 
                    Dist(Neigbors(ii,1),Neigbors(ii,2),Neigbors(ii,3)) = Dist(Xbest(1),Xbest(2),Xbest(3))+h(Neigbors(ii,:),Xbest(1:3),thetaMax);
                    FROM(Neigbors(ii,1),Neigbors(ii,2),Neigbors(ii,3),:) =  Xbest(1:3);  
                    
                end
            else %not in OPEN, add it
                OPEN = [OPEN; Neigbors(ii,:),NeigbCost];
                Dist(Neigbors(ii,1),Neigbors(ii,2),Neigbors(ii,3)) = Dist(Xbest(1),Xbest(2),Xbest(3))+h(Neigbors(ii,:),Xbest(1:3),thetaMax);
                FROM(Neigbors(ii,1),Neigbors(ii,2),Neigbors(ii,3),:) =  Xbest(1:3);  %update back pointer
            end
        end
    end
    [~,sortedIdx] = sort(OPEN(:,4)); %sort points in open by cost
    OPEN = OPEN(sortedIdx,:);
    itr = itr+1;
end

if ~successFlag
    disp('No path found!')
    return
end

[Path] = RecoPath(FROM,Start,Target);

end