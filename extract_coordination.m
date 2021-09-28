
function [shoulder_l,shoulder_r,arm_l,arm_r,forearm_l,forearm_r,hand_l,hand_r] = extract_coordination(time)
 %extract motion coordination from csv 
motion_data = csvread("Ernest-Locomotion_DEFAULT_J32.csv",2);
head = [motion_data(time,37),motion_data(time,38),motion_data(time,39)];
shoulder_r = [motion_data(time,44),motion_data(time,45),motion_data(time,46)]
shoulder_l = [motion_data(time,9),motion_data(time,10),motion_data(time,11)];
arm_r = [motion_data(time,51),motion_data(time,52),motion_data(time,53)];
arm_l = [motion_data(time,16),motion_data(time,17),motion_data(time,18)];
forearm_r = [motion_data(time,58),motion_data(time,59),motion_data(time,60)];
forearm_l = [motion_data(time,23),motion_data(time,24),motion_data(time,25)]
hand_r = [motion_data(time,65),motion_data(time,66),motion_data(time,67)];
hand_l = [motion_data(time,30),motion_data(time,31),motion_data(time,32)];
end

