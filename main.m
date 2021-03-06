
%% 双臂 每个单臂是puma560构型
%左手臂
%       theta    d           a        alpha     offset
L(1)=Link([0       -0.25        0        pi/2      0     -pi/2  ],'modified'); % 关节1这里的最后一个量偏置-pi/2设置是为了将puma560构型的臂垂直下去
L(2)=Link([0       0          0        -pi/2      0    0  ],'modified');
L(3)=Link([0       0           0.2        0          0    -pi/2 ],'modified');
L(4)=Link([0       0.248        0           -pi/2      0     ],'modified');
L(5)=Link([0       0           0           -pi/2       0     ],'modified');
L(6)=Link([0       0            0           pi/2      0     ],'modified');
%                  0.262
p560L=SerialLink(L,'name','LEFT');
p560L.tool=[0 -1 0 0;
               1 0 0 0;
               0 0 1 0.262 ;
               0 0 0 1;]; 
%右手臂     
%       theta    d           a        alpha     offset
R(1)=Link([0       0.25        0        pi/2      0     -pi/2   ],'modified');  % 关节1这里的最后一个量偏置-pi/2设置是为了将puma560构型的臂垂直下去
R(2)=Link([0      0          0           -pi/2      0    0  ],'modified');
R(3)=Link([0       0           0.2        0          0     -pi/2],'modified');
R(4)=Link([0       0.248         0           -pi/2      0     ],'modified');
R(5)=Link([0       0           0           -pi/2       0     ],'modified');
R(6)=Link([0       0           0           pi/2      0     ],'modified');
%                  0.262
p560R=SerialLink(R,'name','RIGHT');
p560R.tool=[0 -1 0 0;
               1 0 0 0;
               0 0 1 0.262 ;
               0 0 0 1;]; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   platform
 
platform=SerialLink([0 0 0 0],'name','platform','modified');%腰部关节
platform.base=[1 0 0 0;
               0 1 0 0;
               0 0 1 0 ;
               0 0 0 1;]; %基座高度
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   R
 
pR=SerialLink([platform,p560R],'name','R'); % 单独右臂模型，加装底座
view(3)
hold on
grid on
axis([-1.2, 1.2, -1.2, 1.2, -1.2, 1.2])
for time = 2:165
[Qinit_shoulder_l,Qinit_shoulder_r,Qinit_arm_l,Qinit_arm_r,Qinit_forearm_l,Qinit_forearm_r,Qinit_hand_l,Qinit_hand_r] = Quaternion_coordinates(1);
[Qwork_shoulder_l,Qwork_shoulder_r,Qwork_arm_l,Qwork_arm_r,Qwork_forearm_l,Qwork_forearm_r,Qwork_hand_l,Qwork_hand_r] = Quaternion_coordinates(time);
%根据关键位置坐标计算各个关节RPY角
shoulder_angle_l = angle_calculation(Qinit_shoulder_l,Qinit_arm_l,Qwork_shoulder_l,Qwork_arm_l);
shoulder_angle_r = angle_calculation(Qinit_shoulder_r,Qinit_arm_r,Qwork_shoulder_r,Qwork_arm_r);
elbow_angle_l = angle_calculation(Qinit_arm_l,Qinit_forearm_l,Qwork_arm_l,Qwork_forearm_l);
elbow_angle_r = angle_calculation(Qinit_arm_r,Qinit_forearm_r,Qwork_arm_r,Qwork_forearm_r);
wrist_angle_l = angle_calculation(Qinit_forearm_l,Qinit_hand_l,Qwork_forearm_l,Qwork_hand_l);
wrist_angle_r = angle_calculation(Qinit_forearm_r,Qinit_hand_r,Qwork_forearm_r,Qwork_hand_r);
s2_r = shoulder_angle_r(3);
s3_r = shoulder_angle_r(2);
E2_r = elbow_angle_r(2);
s1_r = shoulder_angle_r(1);
W2_r = wrist_angle_r(2);
W3_r = wrist_angle_r(1);
pR.plot([0 s2_r s3_r E2_r  s1_r W2_r W3_r]) 
hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   L
pL=SerialLink([platform,p560L],'name','L'); % 单独左臂模型，加装底座
s2_l = shoulder_angle_l(3);
s3_l = shoulder_angle_l(2);
E2_l = elbow_angle_l(2);
s1_l = shoulder_angle_l(1);
W2_l = wrist_angle_l(2);
W3_l = wrist_angle_l(1);

pL.plot([0 s2_l s3_l E2_l  s1_l W2_l W3_l]) 
hold on
end