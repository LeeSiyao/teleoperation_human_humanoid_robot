clc;clear;
%提取关键位置坐标
[Qinit_shoulder_l,Qinit_shoulder_r,Qinit_arm_l,Qinit_arm_r,Qinit_forearm_l,Qinit_forearm_r,Qinit_hand_l,Qinit_hand_r] = Quaternion_coordinates(1);
[Qwork_shoulder_l,Qwork_shoulder_r,Qwork_arm_l,Qwork_arm_r,Qwork_forearm_l,Qwork_forearm_r,Qwork_hand_l,Qwork_hand_r] = Quaternion_coordinates(1086);
%根据关键位置坐标计算各个关节RPY角
shoulder_angle_l = angle_calculation(Qinit_shoulder_l,Qinit_arm_l,Qwork_shoulder_l,Qwork_arm_l);
shoulder_angle_r = angle_calculation(Qinit_shoulder_r,Qinit_arm_r,Qwork_shoulder_r,Qwork_arm_r);
elbow_angle_l = angle_calculation(Qinit_arm_l,Qinit_forearm_l,Qwork_arm_l,Qwork_forearm_l);
elbow_angle_r = angle_calculation(Qinit_arm_r,Qinit_forearm_r,Qwork_arm_r,Qwork_forearm_r);
wrist_angle_l = angle_calculation(Qinit_forearm_l,Qinit_hand_l,Qwork_forearm_l,Qwork_hand_l);
wrist_angle_r = angle_calculation(Qinit_forearm_r,Qinit_hand_r,Qwork_forearm_r,Qwork_hand_r);