%% 标准DH建立puma560机器人模型
clear;
clc;
%建立机器人模型
% theta d a alpha offset
L1=Link([0 0 0 pi/2 0 ],'standard'); %连杆的D-H参数
L2=Link([0 0 0.4318 0 0 ],'standard');
L3=Link([0 0.1501 0.0203 -pi/2 0 ],'standard');
L4=Link([0 0.4318 0 pi/2 0 ],'standard');
L5=Link([0 0 0 -pi/2 0 ],'standard');
L6=Link([0 0 0 0 0 ],'standard');
robot=SerialLink([L1 L2 L3 L4 L5 L6],'name','puma560','base' , ...
transl(0, 0, 0.62)* trotz(0)); %连接连杆，机器人取名puma560
% robot.plot3d([0,pi/2,0,0,pi,0]);%输出机器人模型，后面的六个角为输出时的theta姿态
figure(1)
robot.teach() %teach可视化模型并可以单轴驱动，可以查看模型与实际机器人的关节运动是否一致。
%% 改进DH模型又是怎么样的呢？
rmdh =robot.MDH()%将标准DH转换成改进DH
%%
%将转换后的DH代入Link中，standard改为modified。
clc;
%建立机器人模型
% theta d a alpha offset
L11=Link([0 0 0 0 0 ],'modified'); %连杆的D-H参数
L21=Link([0 0 0 pi/2 0 ],'modified');
L31=Link([0 0.1501 0.4318 0 0 ],'modified');
L41=Link([0 0.4318 0.0203 -pi/2 0 ],'modified');
L51=Link([0 0 0 pi/2 0 ],'modified');
L61=Link([0 0 0 -pi/2 0 ],'modified');
robot1=SerialLink([L11 L21 L31 L41 L51 L61],'name','M_puma560'); %连接连杆，机器人取名M_puma560
% robot1.plot([0,pi/2,0,0,pi,0]);%输出机器人模型，后面的六个角为输出时的theta姿态
figure(2)
robot1.teach() %teach可视化模型并可以单轴驱动，可以查看模型与实际机器人的关节运动是否一致。
%%
%% 定义圆路径
t = (0:0.2:20)'; count = length(t);center = [-0.25 0.6 0.46];radius = 0.1;%圆心和半径
theta = t*(2*pi/t(end));
points =(center + radius*[cos(theta) sin(theta) zeros(size(theta))])';
plot3(points(1,:),points(2,:),points(3,:),'r')
%% 使用Peter工具箱逆解进行轨迹重现
hold on
% axis([-1 1.2 -1 1.2 -1 1.2])
title("工具箱机器人模型末端运动轨迹");
xlabel('x/米','FontSize',12);
ylabel('y/米','FontSize',12);
zlabel('z/米','FontSize',12);
for i = 1:size(points,2)
pause(0.01)
bx = points(1,i);
by = points(2,i);
bz =points(3,i);
tform = rpy2tr(136,-180,-180); %欧拉角转姿态齐次矩阵
targetPos = [bx by bz]; %末端位置向量
% targetOr = [0.02 -0.14 0.99 -0.01] %四元数
% tform = quat2tform(targetOr) %四元数转姿态齐次矩阵
TR=transl(targetPos)*tform; %位姿齐次矩阵
hold on
grid on
plot3(bx,by,bz,'*','LineWidth',1);
q=robot.ikine(TR)
pause(0.01)
robot.plot(q);%动画演示
end