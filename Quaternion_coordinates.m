 function [shoulder_l,shoulder_r,arm_l,arm_r,forearm_l,forearm_r,hand_l,hand_r] = Quaternion_coordinates(time)
%extract Quaternion coordination from csv 
motion_data = csvread("Ernest-Locomotion_DEFAULT_J32.csv",2);
shoulder_r = [motion_data(time,47),motion_data(time,48),motion_data(time,49),motion_data(time,50)];
shoulder_l = [motion_data(time,12),motion_data(time,13),motion_data(time,14),motion_data(time,15)];
arm_r = [motion_data(time,54),motion_data(time,55),motion_data(time,56),motion_data(time,57)];
arm_l = [motion_data(time,19),motion_data(time,20),motion_data(time,21),motion_data(time,22)];
forearm_r = [motion_data(time,61),motion_data(time,62),motion_data(time,63),motion_data(time,64)];
forearm_l = [motion_data(time,26),motion_data(time,27),motion_data(time,28),motion_data(time,29)];
hand_r = [motion_data(time,68),motion_data(time,69),motion_data(time,70),motion_data(time,71)];
hand_l = [motion_data(time,33),motion_data(time,34),motion_data(time,35),motion_data(time,36)];
end
