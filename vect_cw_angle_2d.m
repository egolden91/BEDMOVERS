function [alpha] = vect_cw_angle_2d(vect1,vect2)
%finds the angle between 2 vectors in the CW direction from vect2 to vect1
%Inputs
%   vect1, vect2 are 1X2 vectors in the format of [x,y]
%Outputs
% alpha - the angle between the vect1 and vect2

a = atan2d(vect1(1)*vect2(2)-vect1(2)*vect2(1),...
    vect1(1)*vect2(1)+vect1(2)*vect2(2));

% changing the answer range from [-pi,pi] to [0,2pi]
if a >0 && a<=180
    alpha = 360-a;
elseif a <= 0
    alpha = -a;
else
    warning('illegal angle')
end
end