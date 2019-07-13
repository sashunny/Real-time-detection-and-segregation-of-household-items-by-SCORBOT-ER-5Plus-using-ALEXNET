clear a;
a = arduino;

% ANTICLOCKWISE :: UPWARD
% CLOCKWISE     :: DOWNWARD
%                    INX1    INX2   PWMX     Range      key
                
% base         :       9       8     5     -135/135      1   
% shoulder     :      13      12     4     +35/-130      2  
% elbow        :      44      45     2     -130/130      3   
% pitch (right):      10      11     3     -130/35       4   
% pitch (left) :      34      35     7     -130/130      5     
% gripper      :      33      32     6     -130/130                         




prompt = 'Which joint do you want to move? ';   
key = input(prompt);

if(key == 1)                                   %move the base
    prompt = 'enter the angle in degrees:';
    final_angle = input(prompt);               %user input
    
    voltage =  readVoltage(a,'A15');           %read the voltage from the potentiometer
    degree =  (voltage - 2.5)*270/(-5);        %convert the voltage into degrees
    if(final_angle <135 & final_angle> -135)   %to keep the motor movement within the mechanical limit
        if(degree < final_angle)               
            while degree < final_angle
                clockwise_base(a);             %clockwise movement of base
                voltage =  readVoltage(a,'A15');   
                degree = (voltage - 2.5)*270/(-5)
            end
        elseif(degree > final_angle)
            while degree > final_angle
                anticlockwise_base(a);          %anticlockwise movement of base
                voltage =  readVoltage(a,'A15');
                degree = (voltage - 2.5)*270/(-5)
            end
        end
        softstopit_base(a);                     %stop the motor
    else
        disp('Value is out of range. Please check the angle.');
    end
    
elseif(key == 2)                                %shoulder
    prompt = 'enter the angle in degrees:';
    final_angle = input(prompt);                %user input
    voltage =  readVoltage(a,'A14');            %read the voltage from the potentiometer
    degree =  (voltage - 2.5)*270/(-5);         %convert the voltage into degrees
    if(final_angle <35 & final_angle>-135)      %to keep the motor movement within the mechanical limit
        if(degree < final_angle)
            while degree < final_angle
                clockwise_shoulder(a);          %clockwise movement of shoulder
                voltage =  readVoltage(a,'A14');
                degree = (voltage - 2.5)*270/(-5)
            end
        elseif(degree > final_angle)
            while degree > final_angle
                anticlockwise_shoulder(a);      %anticlockwise movement of shoulder
                voltage =  readVoltage(a,'A14');
                degree = (voltage - 2.5)*270/(-5)
            end
        end 
        softstopit_shoulder(a);                 %to stop the motor
    else
        disp('Value is out of range. Please check the angle.');
    end


elseif(key == 3)                                %elbow
    prompt = 'enter the angle in degrees:';   
    final_angle = input(prompt);                %user input
    voltage =  readVoltage(a,'A13');            %read the voltage from the potentiometer
    degree =  (voltage - 2.5)*270/(-5);         %convert the voltage into degrees
    if(final_angle < 130 & final_angle>-130)    %to keep the motor movement within the mechanical limit
        if(degree < final_angle)
            while degree < final_angle
                clockwise_elbow(a);             %clockwise movement of elbow
                voltage =  readVoltage(a,'A13');
                degree = (voltage - 2.5)*270/(-5)
            end
        elseif(degree > final_angle)
            while degree > final_angle
                anticlockwise_elbow(a);         %anticlockwise movement of elbow
                voltage =  readVoltage(a,'A13');
                degree = (voltage - 2.5)*270/(-5)
            end    
        end
        softstopit_elbow(a);                    %to stop the motor
    else
        disp('Value is out of range. Please check the angle.');
    end
    
elseif(key == 4)                                %pitch right
    prompt = 'enter the angle in degrees:';
    final_angle = input(prompt);                %user input
    voltage =  readVoltage(a,'A12');            %read the voltage from the potentiometer
    degree =   - ((voltage - 2.5)*270/(5))-99;  %convert the voltage into degrees
    if(final_angle <35 & final_angle> -130)     %to keep the motor movement within the mechanical limit
        if(degree < final_angle)
            while degree < final_angle
                clockwise_pitch_right(a);       %clockwise movement of pitch right
                voltage =  readVoltage(a,'A12');
                degree =  - ((voltage - 2.5)*270/(5))-99
            end
        elseif(degree > final_angle)
            while degree > final_angle
                anticlockwise_pitch_right(a);   %anticlockwise movement of pitch right
                voltage =  readVoltage(a,'A12');
                degree =  - ((voltage - 2.5)*270/(5))-99
            end
        end 
        softstopit_pitch_right(a);              %to stop the motor
    else
        disp('Value is out of range. Please check the angle.');
    end
    
 elseif(key == 5)                               %pitch left
    for i=1:4
        anticlockwise_pitch_left(a);            %anticlockwise movement of pitch left
        pause(1);                               %pause for 1 second
        clockwise_pitch_left(a);                %clockwise movement of pitch left
        pause(1);                               %pause for 1 second
    end
 softstopit_pitch_left;                         %to stop pitch left   
end
