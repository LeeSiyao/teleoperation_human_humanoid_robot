function angle = angle_calculation(q_init,Q_init,q_w,Q_w)
% 读取初始化时刻关键位置坐标
T_init = q_init(1)^2 + q_init(2)^2 + q_init(3)^2 + q_init(4)^2;
deltaq_init = [(Q_init(1)*q_init(1) + Q_init(2)*q_init(2) + Q_init(3)*q_init(3) + Q_init(4)*q_init(4))/T_init;
    (-Q_init(1)*q_init(2) + Q_init(2)*q_init(1) + Q_init(3)*q_init(4) - Q_init(4)*q_init(3))/T_init;
    (-Q_init(1)*q_init(3) - Q_init(2)*q_init(4) + Q_init(3)*q_init(1) + Q_init(4)*q_init(2))/T_init;
    (-Q_init(1)*q_init(4) + Q_init(2)*q_init(3) - Q_init(3)*q_init(2) + Q_init(4)*q_init(1))/T_init];
%读取工作时刻关键位置坐标
T_w = q_w(1)^2 + q_w(2)^2 + q_w(3)^2 + q_w(4)^2;
deltaq_w = [(Q_w(1)*q_w(1) + Q_w(2)*q_w(2) + Q_w(3)*q_w(3) + Q_w(4)*q_w(4))/T_w;
    (-Q_w(1)*q_w(2) + Q_w(2)*q_w(1) + Q_w(3)*q_w(4) - Q_w(4)*q_w(3))/T_w;
    (-Q_w(1)*q_w(3) - Q_w(2)*q_w(4) + Q_w(3)*q_w(1) + Q_w(4)*q_w(2))/T_w;
    (-Q_w(1)*q_w(4) + Q_w(2)*q_w(3) - Q_w(3)*q_w(2) + Q_w(4)*q_w(1))/T_w];%绝对偏置四元数
%相对偏置四元数
K = deltaq_w(1)^2 + deltaq_w(2)^2 + deltaq_w(3)^2 + deltaq_w(4)^2;
q_final = [(deltaq_init(1)*deltaq_w(1) + deltaq_init(2)*deltaq_w(2) + deltaq_init(3)*deltaq_w(3) + deltaq_init(4)*deltaq_w(4))/K;
    (-deltaq_init(1)*deltaq_w(2) + deltaq_init(2)*deltaq_w(1) + deltaq_init(3)*deltaq_w(4) - deltaq_init(4)*deltaq_w(3))/K;
    (-deltaq_init(1)*deltaq_w(3) - deltaq_init(2)*deltaq_w(4) + deltaq_init(3)*deltaq_w(1) + deltaq_init(4)*deltaq_w(2))/K;
    (-deltaq_init(1)*deltaq_w(4) + deltaq_init(2)*deltaq_w(3) - deltaq_init(3)*deltaq_w(2) + deltaq_init(4)*deltaq_w(1))/K];
%四元数标准化
norm = sqrt(q_final(1) * q_final(1) + q_final(2) * q_final(2) + q_final(3) * q_final(3) + q_final(4) * q_final(4));
q0 = q_final(1);
q1 = q_final(2);
q2 = q_final(3);
q3 = q_final(4);  

%姿态角计算
pitch = asin(2 * q0 * q2 - 2 * q1 * q3) * 57.3;
roll = atan2(2 * q1 * q2 - 2 * q0 * q3, 2 * q2 * q2 + 2 * q3 * q3 - 1) * 57.3;
yaw = atan2(2 * q2 * q3 + 2 * q0 * q1, 1 - 2 * q1 * q1 - 2 * q2 * q2) * 57.3;

if (-180 < pitch) && (pitch <= -90)
   pitch = -180+pitch; 
elseif (-90 < pitch) && (pitch <= 90)
   pitch = pitch; 
else
   pitch = 180 - pitch; 
end

angle = [roll,pitch,yaw];
end

