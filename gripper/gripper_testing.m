clear a;
a = arduino;
%closing_gripper(a);   %to close the gripper
oppening_gripper(a);   %to open the gripper
pause(0.6);            %pause for 0.6 seconds
softstopit_gripper(a); %stop the motor
