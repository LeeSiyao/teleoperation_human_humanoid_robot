function [pitch,roll,yaw] = attitude_angle(q0,q1,q2,q3)
% Normalized quaternion
norm = sqrt(q0 * q0 + q1 * q1 + q2 * q2 + q3 * q3);
q0 = q0/norm;
q1 = q1/norm;
q2 = q2/norm;
q3 = q3/norm;

% Calculating Euler angle
pitch = -math.asin(2 * q1 * q3 + 2 * q0 * q2) * 57.3
roll = atan2(2 * q1 * q2 - 2 * q0 * q3, 2 * q0 * q0 + 2 * q1 * q1 - 1) * 57.3;
yaw = atan2(2 * q2 * q3 - 2 * q0 * q1, 2 * q0 * q0 + 2 * q3 * q3 - 1) * 57.3;

if -pi < pitch <= -pi/2
   pitch = -pi+pitch 
elseif -pi/2 < pitch <= pi/2
   pitch = pitch 
...
else
   pitch = pi - pitch 
end
end

