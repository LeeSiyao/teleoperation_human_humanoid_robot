L1 = Link('d', 0, 'a', 0, 'alpha', 0); 
L2 = Link('d', 0, 'a', 0, 'alpha',pi/2);  
L3 = Link('d', 0, 'a', 0, 'alpha', pi/2);  
L4 = Link('d', 0, 'a', -0.3, 'alpha',pi/2);  
L5 = Link('d', 0, 'a', -0.2, 'alpha', pi/2);  
L6 = Link('d', 0,'a', 0, 'alpha', pi/2);  

 
armbot=SerialLink([L1,L2,L3,L4,L5,L6]); %SerialLink 机器人   
armbot.name = 'ArmBot';  
armbot.comment = 'shaynerain';  
armbot.display(); %打印   
theta = [0,0,0,0,0,0];   
armbot.plot(theta); %显示
 
