function vector = e2axis(roll, pitch, yaw)

% usage: vector = e2axis(roll, pitch, yaw). roll: x-axis, pitch: y-axis, yaw: z-axis
% get the corresponding axis-angle expression (used in the VRML) from the given Euler angles
% Euler angles rotation sequence: z-y'-x'' (yaw, pitch, roll)
% https://en.wikipedia.org/wiki/Conversion_between_quaternions_and_Euler_angles
% https://www.mathworks.com/matlabcentral/fileexchange/39372-quaternions-from-euler-angles-euler-axis-and-angle

% [q0,q1,q2,q3] = e2q(roll, pitch, yaw);  % get quaternion

% convert Euler angles to quaternion
cy = cos(yaw * 0.5);
sy = sin(yaw * 0.5);
sp = sin(pitch * 0.5);
cp = cos(pitch * 0.5);
cr = cos(roll * 0.5);
sr = sin(roll * 0.5);

q0 = cy .* cp .* cr + sy .* sp .* sr;
q1 = cy .* cp .* sr - sy .* sp .* cr;
q2 = sy .* cp .* sr + cy .* sp .* cr;
q3 = sy .* cp .* cr - cy .* sp .* sr;

% Euler principal rotation angle and Euler axis of rotation
angle = 2*acos(q0);
axis = [q1 q2 q3] / sin(angle/2);
vector = [axis angle];

end