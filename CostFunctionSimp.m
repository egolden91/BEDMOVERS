function cost = CostFunction(P1,P2,theMax)
%euclidian
cost1 = sqrt((P1(1)-P2(1))^2 + (P1(2)-P2(2))^2);%+(P1(3)-P2(3))^2);  
% cost2 = sqrt((P1(1)-P2(1))^2 + (P1(2)-P2(2))^2+(P1(3)-P2(3)+theMax)^2);
% cost3 = sqrt((P1(1)-P2(1))^2 + (P1(2)-P2(2))^2+(P1(3)-P2(3)-theMax)^2);
%manhatten
% cost1 = abs(P1(1)-P2(1)) + abs(P1(2)-P2(2))+abs(P1(3)-P2(3)); 
% cost2 = abs(P1(1)-P2(1)) + abs(P1(2)-P2(2))+abs(P1(3)-P2(3)+theMax);
% cost3 = abs(P1(1)-P2(1)) + abs(P1(2)-P2(2))+abs(P1(3)-P2(3)-theMax);

% cost = min([cost1,cost2,cost3]);
cost = cost1;

return
